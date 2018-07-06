<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\helpers\Url;

$this->title = 'Форма входа';
?>
<div class="forma_login">
    <a class="hiddenanchor" id="toregister"></a>
    <a class="hiddenanchor" id="tologin"></a>

    <div id="wrapper">
        <div id="login" class="animate form">
            <section class="login_content">
                <?php $form = ActiveForm::begin(['id' => 'login-form']); ?>

                <h1><?= Html::encode($this->title) ?></h1>

                <div class="form-control_div">
                    <input type="text" class="form-control" name="LoginForm[username]" placeholder="Username" required="" />
                </div>
                <div  class="form-control_div">
                    <input type="password" class="form-control" name="LoginForm[password]" placeholder="Password" required="" />

                </div>

                <div>
                    <?= Html::submitButton('Авторизоваться', ['class' => 'btn btn-default submit', 'name' => 'login-button']) ?>
                    <a class="reset_pass" href="<?= Url::toRoute('/signup', true); ?>">Забыли пароль?</a>
                </div>
                <div class="clearfix"></div>
                <div class="separator">

                    <p class="change_link">
                        <a href="<?= Url::toRoute('/signup', true); ?>" class="to_register"> Создать учётную запись</a>
                    </p>
                    <div class="clearfix"></div>

                </div>
                <?php ActiveForm::end(); ?>

            </section>
        </div>

    </div>
</div>
