<?php

namespace app\models;

use Yii;


class Manifestation extends \yii\db\ActiveRecord
{
    public $photo;
    public $_image;

    public static function tableName()
    {
        return 'manifestation';
    }

    public function rules()
    {
        return [
            [['date'], 'safe'],
            [['title', 'description'], 'string', 'max' => 600],
            [['text'], 'string'],
            [['photo'], 'file', 'extensions' => 'png, jpg'],
            ['_image', 'safe'],

        ];
    }



    public function beforeSave($insert)
    {
        if (is_string($this->_image) && strstr($this->_image, 'data:image')) {

            $data = $this->_image;
            $data = base64_decode(preg_replace('#^data:image/\w+;base64,#i', '', $data));
            $fileName = time() . '-' . rand(100000, 999999) . '.png';
            file_put_contents(Yii::getAlias('@app/web/images/manifestation') . '/' . $fileName, $data);
            if (!$this->isNewRecord && !empty($this->image)) {
                unlink(Yii::getAlias('@app/web/images/manifestation/'.$this->image));
            }
            $this->image =  '/images/manifestation/' . $fileName;
        }

        return parent::beforeSave($insert);
    }

    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'date' => 'Дата добавления',
            'title' => 'Название объявления',
            'photo' => 'Изображение',
            'description' => 'Краткое описание',
            'text' => 'Объявление',
        ];
    }


    public function upload()
    {
        if ($this->validate() && $this->photo) {
            $this->photo->saveAs(Yii::getAlias('@app') . '/web/images/manifestation/' . $this->photo->baseName . '.' . $this->photo->extension);
            return true;
        } else {
            return false;
        }
    }


    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

}
