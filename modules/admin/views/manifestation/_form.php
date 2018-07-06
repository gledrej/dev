<?php
use yii\helpers\Url;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\file\FileInput;
use dosamigos\tinymce\TinyMce;
use yii\base\View;
?>

<div class="manifestation-form">

    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>

    <div class="col-md-12">
        <div class="col-md-4 submit_admin_image">
            <div class="col-md-12 submit_admin_image">
                <?= $form->field($model, '_image')->widget(\bilginnet\cropper\Cropper::className(), [
                    'uniqueId' => 'image_cropper',
                    'cropperOptions' => [
                        'width' => 1300,
                        'height' => 790,
                        'preview' => [
                            'url' => $model->image,
                            'width' => '100%',
                            'height' => 'auto',
                        ],
                    ],
                    'label' => 'Добавить изображение',
                    'template' => '{preview}{button}',
                ]);
                ?>
            </div>

        </div>
        <div class="col-md-8">
            <?= $form->field($model, 'title')->textInput(['rows' => 6]) ?>
        </div>
    </div>
    <div class="col-md-12">
        <?= $form->field($model, 'description')->widget(TinyMce::className(), [
            'options' => ['rows' => 6],
            'language' => 'ru',
            'clientOptions' => [
                'plugins' => ['advlist', 'anchor', 'charmap', 'image', 'hr', 'imagetools', 'link', 'lists', 'media', 'paste', 'table'],
                'toolbar' => 'image',
                'image_advtab' => true,
                'toolbar' => 'undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | responsivefilemanager link image media',
                'external_filemanager_path' => '/plugins/responsivefilemanager/filemanager/',
                'filemanager_title' => 'Responsive Filemanager',
                'external_plugins' => [
                    'filemanager' => '/plugins/responsivefilemanager/filemanager/plugin.min.js',
                    'responsivefilemanager' => '/plugins/responsivefilemanager/tinymce/plugins/responsivefilemanager/plugin.min.js',
                ],
            ]
        ]); ?>


    </div>
    <div class="col-md-12">
        <?= $form->field($model, 'text')->widget(TinyMce::className(), [
            'options' => ['rows' => 6],
            'language' => 'ru',
            'clientOptions' => [
                'plugins' => ['advlist', 'anchor', 'charmap', 'image', 'hr', 'imagetools', 'link', 'lists', 'media', 'paste', 'table'],
                'toolbar' => 'image',
                'image_advtab' => true,
                'toolbar' => 'undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | responsivefilemanager link image media',
                'external_filemanager_path' => '/plugins/responsivefilemanager/filemanager/',
                'filemanager_title' => 'Responsive Filemanager',
                'external_plugins' => [
                    'filemanager' => '/plugins/responsivefilemanager/filemanager/plugin.min.js',
                    'responsivefilemanager' => '/plugins/responsivefilemanager/tinymce/plugins/responsivefilemanager/plugin.min.js',
                ],
            ]
        ]); ?>
    </div>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Добавить' : 'Обновить', ['class' => $model->isNewRecord ? 'btn btn-success form-group' : 'btn btn-primary form-group']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
