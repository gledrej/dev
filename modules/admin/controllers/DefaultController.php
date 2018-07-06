<?php

namespace app\modules\admin\controllers;

use app\models\Contact;
use yii\web\Controller;


class DefaultController extends Controller
{
    public function actionIndex()
    {
        return $this->render('index');
    }
}
