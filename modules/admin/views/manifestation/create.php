<?php

use yii\helpers\Html;


$this->title = 'Добавить объявление';
$this->params['breadcrumbs'][] = ['label' => 'Manifestations', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="manifestation-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
