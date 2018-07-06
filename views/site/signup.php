<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

$this->title = 'Регистрация';
?>
<div class="col-md-12">
    <a class="hiddenanchor" id="toregister"></a>
    <a class="hiddenanchor" id="tologin"></a>

    <div id="wrapper">
        <div id="login" class="animate form">
            <div class="col-md-12">
                <?php $form = ActiveForm::begin(['id' => 'form-signup']); ?>

                <h1><?= Html::encode($this->title) ?></h1>

                <div class="form-control_div form_signup_input">
                    <?= $form->field($model, 'username') ?>
                </div>
                <div  class="form-control_div form_signup_input">
                    <?= $form->field($model, 'email') ?>
                </div>
                <div  class="form-control_div form_signup_input">
                    <?= $form->field($model, 'password')->passwordInput() ?>
                </div>
                <div>
                    <?= Html::submitButton('Регистрация', ['class' => 'btn btn-primary', 'name' => 'signup-button']) ?>
                </div>

                <?php ActiveForm::end(); ?>

            </div>
        </div>

    </div>
</div>
