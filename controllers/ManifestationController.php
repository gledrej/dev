<?php

namespace app\controllers;

use Yii;
use yii\web\Controller;
use app\models\Manifestation;
use yii\data\Pagination;

class ManifestationController extends Controller
{

    public function actionIndex()
    {
        $query = Manifestation::find()->joinWith('user');
        $countQuery = clone $query;
        $pages = new Pagination(['totalCount' => $countQuery->count(), 'pageSize' => 20]);
        $pages->pageSizeParam = false;
        $model = $query->offset($pages->offset)
            ->limit($pages->limit)
            ->all();
        return $this->render('index', [
            'model' => $model,
            'pages' => $pages,

        ]);
    }

}
