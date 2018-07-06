<?php
namespace app\components;

use Yii;

class User extends \yii\web\User
{
    public function getUsername()
    {
        return \Yii::$app->user->identity->username;
    }
    public function getName()
    {
        return \Yii::$app->user->identity->name;
    }
}