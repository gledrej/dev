<?php
use yii\widgets\LinkPager;
use yii\helpers\Url;
use yii\helpers\Html;

?>
<div class="col-md-12 manifestation_index_title">
    <h2>Объявления</h2>
</div>
<?php foreach ($model as $row){ ?>
    
<div class="col-md-12 manifestation_index_content">
    <div class="col-md-3 manifestation_index_content_image">
        <?=Html::img($row->image); ?>
    </div>
    <div class="col-md-9">
        <div class="col-md-12">
            <div class="col-md-8"></div>
            <div class="col-md-4 manifestation_index_content_info">
               <!-- --><?/*=$row->user->username; */?>
                <?=Yii::$app->formatter->asDatetime($row->date, "php: H:i d.m.Y"); ?>
            </div>
        </div>
        <div class="col-md-12 manifestation_index_content_desctiption"><?=$row->description; ?></div>
    </div>
</div>
<?php } ?>
<div class="col-md-12 manifestation_index_content_pagination">
    <?=LinkPager::widget([
        'pagination' => $pages,
    ]);
    ?>
</div>


