<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-colorasproduct" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-colorasproduct" class="form-horizontal">

            <ul class="nav nav-tabs">
                <li class="active"><a href="#tab-general" data-toggle="tab">Основные настройки</a></li>
                <li><a href="#tab-data" data-toggle="tab">Инструкция</a></li>
                <li><a href="#tab-modules" data-toggle="tab">Полезное</a></li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane active" id="tab-general">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" >Лицензионный ключ</label>
                        <div class="col-sm-2">
                            <input type="text" value="<?php if (!empty($colorasproduct_key)) { echo $colorasproduct_key; } ?>" name="colorasproduct_key" placeholder="" class="form-control">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><?php echo $c_title; ?></label>
                        <div class="col-sm-10">
                            <input type="text" placeholder="Цвета товара" name="colorasproduct_title" class="form-control" value="<?php echo $colorasproduct_title; ?>">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><?php echo $c_method; ?></label>
                        <div class="col-sm-10">
                            <label for="" class="radio-inline"> <input type="radio" name="colorasproduct_method" value="0"  <?php if ($colorasproduct_method == 0) { echo "checked='checked'"; } ?>> Миниатюра + название</label>
                            <label for="" class="radio-inline"> <input type="radio" name="colorasproduct_method" value="1" <?php if ($colorasproduct_method == 1) { echo "checked='checked'"; } ?>> Цвет + название</label>
                            <label for="" class="radio-inline"> <input type="radio" name="colorasproduct_method" value="2" <?php if ($colorasproduct_method == 2) { echo "checked='checked'"; } ?>> Только цвет</label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><span data-toggle="tooltip" title="Работает только с видом отображения Только Цвет"><?php echo $c_kra; ?></span></label>
                        <div class="col-sm-10">
                            <select name="colorasproduct_kra" class="form-control">
                                <option value="0" <?php if ($colorasproduct_kra == 0) { echo "selected='selected'"; } ?>>Цветовые круги</option>
                                <option value="1" <?php if ($colorasproduct_kra == 1) { echo "selected='selected'"; } ?>>Стильные квадраты</option>
                                <option value="2" <?php if ($colorasproduct_kra == 2) { echo "selected='selected'"; } ?>>Загадочные образы</option>
                                <option value="3" <?php if ($colorasproduct_kra == 3) { echo "selected='selected'"; } ?>>Формула 1</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><?php echo $c_view; ?></label>
                        <div class="col-sm-10">
                            <select name="colorasproduct_price" class="form-control">
                                <option value="0"<?php if ($colorasproduct_price == 0) { echo "selected='selected'"; } ?>><?php echo $c_sk; ?></option>
                                <option value="1"<?php if ($colorasproduct_price == 1) { echo "selected='selected'"; } ?>><?php echo $c_ot; ?></option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><?php echo $c_styles; ?></label>
                        <div class="col-sm-10">
                            <select name="colorasproduct_style" class="form-control">
                                <option value="0"<?php if ($colorasproduct_style == 0) { echo "selected='selected'"; } ?>><?php echo $text_enabled; ?></option>
                                <option value="1"<?php if ($colorasproduct_style == 1) { echo "selected='selected'"; } ?>><?php echo $text_disabled; ?></option>
                            </select>
                        </div>
                    </div>
                    <!--div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><?php echo $c_min; ?></label>
                        <div class="col-sm-10">
                            <select name="colorasproduct_stylemin" class="form-control">
                                <option value="0"<?php if ($colorasproduct_stylemin == 0) { echo "selected='selected'"; } ?>><?php echo $text_enabled; ?></option>
                                <option value="1"<?php if ($colorasproduct_stylemin == 1) { echo "selected='selected'"; } ?>><?php echo $text_disabled; ?></option>
                            </select>
                        </div>
                    </div-->

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><?php echo $c_thumb; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="colorasproduct_width" value="<?= (!empty($colorasproduct_width)) ? $colorasproduct_width : '0'; ?>" class="form-control radio-inline" style="width: 5%"> px
                            <input type="text" name="colorasproduct_height" value="<?= (!empty($colorasproduct_height)) ? $colorasproduct_height : '0'; ?>" class="form-control radio-inline" style="width: 5%"> px
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><?php echo $c_selector; ?></label>
                        <div class="col-sm-10">
                            <input type="text" placeholder="#mydiv" name="colorasproduct_selector" class="form-control" value="<?php echo $colorasproduct_selector; ?>">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                        <div class="col-sm-10">
                            <select name="colorasproduct_status" id="input-status" class="form-control">
                                <?php if ($colorasproduct_status) { ?>
                                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                    <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                    <option value="1"><?php echo $text_enabled; ?></option>
                                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="tab-pane" id="tab-data">
                    <div class="form-group">
                        <div class="col-sm-12">
                            <strong>========= Установка ==============</strong><br>
                            1. Установите модуль через менеджер дополнений<br>
                            2. Обновите кеш модификаторов<br>
                            <br><br>
                                <strong> ========= Активация ==============</strong><br>
                            1. Для активации модуля, автор должен выслать Вам ключ (если не пришел автоматически в течении 5 минут, напишите автору модуля в личные сообщения).<br>
                            2. Данный ключ нужно ввести настройках в поле "Лицензионный ключ" модуля и сохранить.<br>
                            3. Заново входите в настройки и приступайте к редактированию<br>
                            <br><br>
                            <strong> ========= Настройка ============</strong><br>
                            1. После установки и активации модуля добавьте его в схему продукта. (Схемы (макеты) -> Продукт (product)). Выбираем верхнюю или нижнюю схему.<br>
                            2. Добавьте цвета и связи с другими товарами на вкладке продукта "Цвета товара". Заполните 2 поля. Название - обычное текстовое название. HTML-код цвета - вставляем без решетки (например: ff0000). В выпадающем списке выберите другие товары с цветами этого товара.
                            <br><br>
                             <strong> =========== Обновление ===========</strong><br>
                            Если у Вас уже установлен модуль и Вы хотите обновится на новую версию, то делаем следующее:<br>
                            <br><br>
                            1. Перед обновлением, сделайте бэкап файлов и базы-данных.<br>
                            2. Зайдите в папку с обновлением и выберите версию Вашего OpenCart / OcStore<br>
                            3. Установите модуль.<br>
                            4. Заново по FTP установите ключ-активации.<br>
                            5. Почистите кеш сайта и обновите кеш модификаторов.
                            <br><br>
                            P.S. Если вместо обновления, вы установите чистый модуль. Скорее всего связи цветов исчезнут! Сделайте бекап перед процедурой обновления.
                            <br><br>
                            <strong>======= Дополнительно =========</strong>
                            <br>1. Если Вы используете только цвет. Заполнять поле "Название цвета" необязательно.
                            <br> 2. Если Вы хотите поместить Ваш модуль в любое место в шаблоне, для этого в коде продукта (product.tpl или product.twig) создайте блок, например: <xmp><div id="colorasproduct"></div></xmp>и в настройках модуля установите в поле "селектор" - #colorasproduct
                            <br> 3. Для вывода цветов в категории (category.tpl или category.twig), создайте селектор: <xmp><div class="colorscat"></div></xmp>  там, где у Вас идет цикл вывода товаров. Модуль автоматически подгрузит цвета в этом месте.
                            <br><br>
                             <strong style="color:red;">======= Платные услуги =========</strong><br>
                            1. Помощь в размещении модуля в карточке товара в любом месте. Правка вёрстки для установки модуля в нужное место - 500 руб.<br>
                            2. Решение проблем с конфликтом модулей, которые мешают нормальной работе модуля - 500 руб.<br>
                            
                            <a class="btn btn-primary" style="margin-top: 25px;" target="_blank" href="https://opencartforum.com/profile/17442-leingard/?tab=node_downloads_Files">
                               Другие полезные модули от автора
                            </a>
                        </div>
                    </div>

                </div>

                <div class="tab-pane" id="tab-modules">
                    <div class="col-sm-12">
                        <div class="col-sm-2">
                            <div class="thumbnail">
                                <img src="http://gameshara.ru/module/image/fakereviews.jpg" alt="...">
                                <div class="caption">
                                    <h3>Генерация отзывов для товаров</h3>
                                    <p>Модуль позволяет сгенерировать отзывы для Ваших товаров и тем самым повысить доверие к магазину</p>
                                    <p><a target="_blank" rel="nofollow"  href="https://opencartforum.com/files/file/5166-fakereviews-pro-generaciya-otzyvov-dlya-tovarov/" class="btn btn-primary" role="button">Купить</a> <a target="_blank" rel="nofollow" href="http://gameshara.ru/module/index.php?route=product/product&product_id=43" class="btn btn-default" role="button">Демо</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="thumbnail">
                                <img src="http://gameshara.ru/module/image/colorasproduct.jpg" alt="...">
                                <div class="caption">
                                    <h3>Цвета товара как отдельные товары</h3>
                                    <p>Модуль предназначением для тех, кому требуется оформить другие цвета товара - как отдельные товары.</p>
                                    <p><a target="_blank" rel="nofollow" href="https://opencartforum.com/files/file/4986-colorasproduct-cveta-tovara-kak-otdelnye-tovary/" class="btn btn-primary" role="button">Купить</a> <a target="_blank" rel="nofollow" href="http://gameshara.ru/module/index.php?route=product/product&product_id=50" class="btn btn-default" role="button">Демо</a></p>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-2">
                            <div class="thumbnail">
                                <img src="http://gameshara.ru/module/image/mymobmenu.jpg" alt="...">
                                <div class="caption">
                                    <h3>Мобильное меню для магазина</h3>
                                    <p>Удобное адаптивное мобильное меню для Вашего магазина. Прекрасно сочетается с любым дизайном и значительно упрощает Вашим посетителям взаимодействие с Вашим сайтом.</p>
                                    <p><a target="_blank" rel="nofollow" href="https://opencartforum.com/files/file/6211-mobilnoe-menyu-dlya-magazina-mymobmenu-pro/" class="btn btn-primary" role="button">Купить</a> <a target="_blank" rel="nofollow" href="http://gameshara.ru/module/" class="btn btn-default" role="button">Демо</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="thumbnail">
                                <img src="http://gameshara.ru/module/image/fakeorders.jpg" alt="...">
                                <div class="caption">
                                    <h3>Имитация заказов на сайте</h3>
                                    <p>Интерактивный модуль имитации заказов на сайте, который значительно повысит доверие Ваших клиентов к Вашему сайту!</p>
                                    <p><a target="_blank" rel="nofollow" href="https://opencartforum.com/files/file/5040-fakeorders-151-pro-imitaciya-zakazov-na-sayte/" class="btn btn-primary" role="button">Купить</a> <a target="_blank" rel="nofollow" href="http://gameshara.ru/module/index.php?route=product/category&path=20" class="btn btn-default" role="button">Демо</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="thumbnail">
                                <img src="http://gameshara.ru/module/image/toolbar.jpg" alt="...">
                                <div class="caption">
                                    <h3>Панель состояния Ваших товаров и заказов</h3>
                                    <p>Toolbar PRO - панель состояния Ваших товаров и заказов. Узнайте какого товара не хватает на складе или например в каком не выбрано изображение. Отобразите все товары за вчерашний день, если вдруг их пропустили :) </p>
                                    <p><a target="_blank" rel="nofollow" href="https://opencartforum.com/files/file/5942-toolbar-pro%C2%A0-%C2%A0panel-sostoyaniya%C2%A0vashih-tovarov-i-zakazov/" class="btn btn-primary" role="button">Купить</a> <a target="_blank" rel="nofollow" href="https://opencartforum.com/files/file/5942-toolbar-pro%C2%A0-%C2%A0panel-sostoyaniya%C2%A0vashih-tovarov-i-zakazov/" class="btn btn-default" role="button">Демо</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="thumbnail">
                                <img src="http://gameshara.ru/module/image/preloader.jpg" alt="...">
                                <div class="caption">
                                    <h3>Preloader Pro - красивая загрузка Вашего магазина</h3>
                                    <p>Модуль добавляет Preloader для Вашего магазина. </p>
                                    <p><a target="_blank" rel="nofollow" href="https://opencartforum.com/files/file/7010-preloader-pro-krasivaya-zagruzka-vashego-magazina/" class="btn btn-primary" role="button">Купить</a> <a target="_blank" rel="nofollow" href="http://gameshara.ru/module/" class="btn btn-default" role="button">Демо</a></p>
                                </div>
                            </div>
                        </div>
                    </div>



                </div>

            </div>


        </form>
      </div>
    </div>
  </div>
  

  
  
</div>
<?php echo $footer; ?>