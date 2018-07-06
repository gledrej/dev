<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\StringHelper;

$this->title = 'Объявления';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="manifestation-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Добавить объявление', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([

        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            ['class' => 'yii\grid\ActionColumn', 'template' => '{update}'],
            ['class' => 'yii\grid\ActionColumn', 'template' => '{view}'],
            'image:image',
            [
                'attribute' => 'title',
                'format' => 'text',
                'content' => function ($models) {
                    return StringHelper::truncate($models->description,60,'...');
                }
            ],
            [
                'attribute' => 'description',
                'format' => 'html',
                'content' => function ($models) {
                    return StringHelper::truncate($models->description,160,'...');
                }
            ],
            [
                'attribute' => 'text',
                'format' => 'html',
                'content' => function ($models) {
                    return StringHelper::truncate($models->description,160,'...');
                }
            ],
            'date:datetime',

            ['class' => 'yii\grid\ActionColumn', 'template' => '{delete}'],
        ],
    ]); ?>
</div>
