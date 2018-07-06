<?php

use yii\helpers\Html;

$this->title = 'Редактировать объявление: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Manifestations', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="manifestation-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
