

<?php echo $header; ?>



<script src="/catalog/view/javascript/jquery.maskedinput.min.js" type="text/javascript"></script>

<link rel="stylesheet" href="/catalog/view/theme/default/stylesheet/auth_page.css" />

<div class="auth_wrapper page_1">
    <div class="auth_wrapper_content">
        <div class="auth_content_box">
            <div></div>
            <div class="auth_content">
                <div class="auth_input_phone">
                    <select class="select_numberformat">
                        <option value="" disabled="" hidden=""></option>
                        <option  checked="checked" data-mask="(nnn) nnn-nn-nn" value="ru">🇷🇺 +7</option>
                        <option data-mask="(nn) nnn-nn-nn" value="by">🇧🇾 +375</option>
                        <option data-mask="(nnn) nnn-nn-nn" value="kz">🇰🇿 +7</option>
                        <option data-mask="(nnn) nnn-nn-nn" value="am">🇦🇲 +374</option>
                        <option  data-mask="(nnn) nnn-nn-nn" value="kz">🇰🇬 +996</option>
                    </select>
                    <input class="input_telephone_auth"  type="tel" placeholder="ваш номер телефона">
                    <svg class="input_clear" width="12" height="12" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M0.357429 0.357429C0.834001 -0.119143 1.60668 -0.119143 2.08325 0.357429L8 6.27418L13.9167 0.357429C14.3933 -0.119143 15.166 -0.119143 15.6426 0.357429C16.1191 0.834001 16.1191 1.60668 15.6426 2.08325L9.72582 8L15.6426 13.9167C16.1191 14.3933 16.1191 15.166 15.6426 15.6426C15.166 16.1191 14.3933 16.1191 13.9167 15.6426L8 9.72582L2.08325 15.6426C1.60668 16.1191 0.834001 16.1191 0.357429 15.6426C-0.119143 15.166 -0.119143 14.3933 0.357429 13.9167L6.27418 8L0.357429 2.08325C-0.119143 1.60668 -0.119143 0.834001 0.357429 0.357429Z" fill="#B6B2B0"></path></svg>
                </div>
                <div class="repeat_call"><button></button></div>
            </div>
            <div class="auth_agree">
                <div class="auth_agree_content">
                    <svg width="10" height="10" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <g clip-path="url(#clip0_31095_194382)">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M16 0.771639L5.5627 16L0 9.38683L1.10688 8.50594L5.44523 13.6636L14.81 0L16 0.771639Z" fill="white"></path>
                        </g>
                        <defs>
                            <clipPath id="clip0_31095_194382">
                                <rect width="16" height="16" fill="white"></rect>
                            </clipPath>
                        </defs>
                    </svg>
                </div>
                <p>Продолжая, я соглашаюсь с условиями <a href="/articles/documents">оферты</a> и принимаю <a href="/articles/documents">политику конфиденциальности</a></p>
            </div>
        </div>
    </div>
</div>
<div class="auth_wrapper page_2">
    <div class="auth_wrapper_content">
        <div class="auth_content_box">

    
            <div class="auth_agree">
                <div class="auth_agree_content">
                    <div class="text_telephone_numbers"><p>введите последние 4 цифры номера</p><p>+7 (123) 456 <span>XX - XX</span></p></div>
           
                    <div class="input_pincode">
                        <input class="inputnum" inputmode="numeric" maxlength="1" autocomplete="one-time-code" value="">
                        <input class="inputnum" inputmode="numeric" maxlength="1" autocomplete="" value="">
                        <input class="inputnum" inputmode="numeric" maxlength="1" autocomplete="" value="">
                        <input class="inputnum" inputmode="numeric" maxlength="1" autocomplete="" value="">
                    </div>
                    <div class="cur_telephone_info">Ваш номер телефона<br><span class="you_phone"></span></div>
                </div>
            </div>

            <div class="recall_content"><div class="recall_content_item"><span>Повторный звонок</span></div></div>

        </div>
    </div>
</div>

<script>

$(document).ready(function(){

    $('body').on('click','.input_clear',function(){

        $('.input_telephone_auth').val('');
        $('.input_telephone_auth').attr('value','');


    });

    localStorage.removeItem('error_call');
        $('.select_numberformat').on('change', function(e){


                    
        if($(this).find('option:checked').attr('value') == 'by'){

            if($('.input_telephone_auth').val() != ''){

                var valText = $('.input_telephone_auth').val();

                var valTextPrepare = valText.replace(/[^0-9]/g, '');

                var newFormat = '(' + valTextPrepare.slice(0, 2) + ')' + ' ' + valTextPrepare.slice(2,5) + '-'+ valTextPrepare.slice(5,8) + '-' + valTextPrepare.slice(8,9);
                
                $('.input_telephone_auth').val(newFormat);

            }

        }
        if($(this).find('option:checked').attr('value') == 'ru'){

            if($('.input_telephone_auth').val() != ''){

                var valText = $('.input_telephone_auth').val();

                var valTextPrepare = valText.replace(/[^0-9]/g, '');

                var newFormat = '(' + valTextPrepare.slice(0, 3) + ')' + ' ' + valTextPrepare.slice(3,6) + '-'+ valTextPrepare.slice(6,8) + '-' + valTextPrepare.slice(8,10);
                
                $('.input_telephone_auth').val(newFormat);

            }

        }
        if($(this).find('option:checked').attr('value') == 'kz'){

            if($('.input_telephone_auth').val() != ''){

                var valText = $('.input_telephone_auth').val();

                var valTextPrepare = valText.replace(/[^0-9]/g, '');

                var newFormat = '(' + valTextPrepare.slice(0, 3) + ')' + ' ' + valTextPrepare.slice(3,6) + '-'+ valTextPrepare.slice(6,8) + '-' + valTextPrepare.slice(8,10);
                
                $('.input_telephone_auth').val(newFormat);

            }

        }
        if($(this).find('option:checked').attr('value') == 'am'){

            if($('.input_telephone_auth').val() != ''){

                var valText = $('.input_telephone_auth').val();

                var valTextPrepare = valText.replace(/[^0-9]/g, '');

                var newFormat = '(' + valTextPrepare.slice(0, 3) + ')' + ' ' + valTextPrepare.slice(3,6) + '-'+ valTextPrepare.slice(6,8) + '-' + valTextPrepare.slice(8,10);
                
                $('.input_telephone_auth').val(newFormat);

            }

        }
        if($(this).find('option:checked').attr('value') == 'kg'){

            if($('.input_telephone_auth').val() != ''){

                var valText = $('.input_telephone_auth').val();

                var valTextPrepare = valText.replace(/[^0-9]/g, '');

                var newFormat = '(' + valTextPrepare.slice(0, 3) + ')' + ' ' + valTextPrepare.slice(3,6) + '-'+ valTextPrepare.slice(6,8) + '-' + valTextPrepare.slice(8,10);
                
                $('.input_telephone_auth').val(newFormat);

            }

        }
        // if($(this).find('option:checked').attr('value') == 'ru'){

        //     if($('.input_telephone_auth').val() != ''){

        //         var valText = $('.input_telephone_auth').val();

        //         var valTextPrepare = valText.replace(/[^0-9]/g, '');

        //         var newFormat = '(' + valTextPrepare.slice(0, 3) + ') ' + valTextPrepare.slice(1);

        //         $('.input_telephone_auth').val(newFormat);

        //     }

        // }


        });

        $('.input_telephone_auth').on('keypress', function(e){

            var code = e.keyCode || e.which; 




            if($('.select_numberformat option:checked').attr('value') == 'ru'){
                if($(this).val().length == 0){
                    $(this).val('(');
                }

                if($(this).val().length == 1){
                        
                    var code = e.keyCode || e.which; 

                    //если второе число не равно 9, тогда блочим
                    if (code  != 57) {  
                        console.log('9 no pressed');
                        e.preventDefault();
                        return false;

                    } else {
                        console.log('9 pressed');
                    }

                }

                if($(this).val().length == 4){

                    $(this).val($(this).val() + ')');

                }
                if($(this).val().length == 5){

                    $(this).val($(this).val() + ' ');

                }
                if($(this).val().length == 9){

                $(this).val($(this).val() + '-');

                }
                if($(this).val().length == 12){

                $(this).val($(this).val() + '-');

                }
                if($(this).val().length >= 14){




                        //отправляем звонок
                        $.ajax({
                            url: 'index.php?route=account/account/auth',
                            type: 'post',
                            data: {telephone: $('.select_numberformat option:checked').text().trim() + ' ' + $(this).val() + String.fromCharCode(e.which)},
                            dataType: 'json',
                            beforeSend: function(data) {
                                console.log(data);
                            },
                            success: function(json) {
                                $('.input_telephone_auth').removeClass('error');
                                if(json['response']) {
                                    if(json['response']['request_id']){
                                        var code = json['response']['code'];

                                        $('.cur_telephone_info .you_phone').html(json['telephone']); 

                                        console.log(code);

                                        $('p.р1_subtitle').hide();

                                        $('.back_to_page').addClass('page_2');
                                        $('.back_to_page').removeAttr('onclick');

                                        $('.page_1').hide();
                                        $('.page_2').show();
                                    } else {
                                        $('.input_telephone_auth').addClass('error'); 
                                        if(localStorage.getItem('error_call')){
                                            
                               
                                                 $('.input_telephone_auth').prop('disabled',true);
                                            $('select.select_numberformat').prop('disabled',true);
                                            $('.repeat_call button').html('<p>вы сможете заказать звонок повторно <br> через <span>60</span> секунд...</p>');
                                            let intervalId = setInterval(function(){

                                                var seconds = $('.repeat_call button p span').text().trim();

                                                var new_sec = parseInt(seconds) - 1;

                                                if(new_sec > 0){
                                                    $('.repeat_call button p span').html(new_sec);
                                                } else {
                                                    clearInterval(intervalId);
                                                    $('.repeat_call button').html('<a class="repeat_callback_btn" href="#">Заказать повторный звонок</a>');
                                                }
                                             

                                            },1000);
                                            localStorage.removeItem('error_call');
                                            
                                        }

                                        if(!localStorage.getItem('error_call')){
                                            localStorage.setItem('error_call','1');
                                        }
                                       
                                        $('body').append('<div class="success_wrapper_note"><div class="success_in_cart"></div></div>');

                                        var html = '<div class="in_cart_content">';
                                        html +=  json['error'];
                                        html += '</div>';                            

                                        $('.success_in_cart').html(html);

                                        $('.success_wrapper_note').animate({top:'-=10px',opacity:'1'},150);

                                        setTimeout(function(){
                                            $('.success_wrapper_note').fadeOut(300);
                                            $('.success_wrapper_note').remove();
                                        },3000);
                                    }
                                }

                            }

                        });
                 
         
             



           

          

                }

                if($(this).val().length >= 15){
                        return false;
                }
            }
            
            if($('.select_numberformat option:checked').attr('value') == 'by'){
                if($(this).val().length >= 13){

                    //отправляем звонок

                 //отправляем звонок


                        $.ajax({
                            url: 'index.php?route=account/account/auth',
                            type: 'post',
                            data: {telephone: $('.select_numberformat option:checked').text().trim() + ' ' + $(this).val()},
                            dataType: 'json',
                            beforeSend: function(data) {
                                console.log(data);
                            },
                            success: function(json) {
                                if(json['response']) {
                                    if(json['response']['request_id']){
                                        var code = json['response']['code'];

                                        $('.cur_telephone_info .you_phone').html(json['telephone']); 

                                        console.log(code);

                                        $('p.р1_subtitle').hide();

                                        $('.back_to_page').addClass('page_2');
                                        $('.back_to_page').removeAttr('onclick');

                                        $('.page_1').hide();
                                        $('.page_2').show();
                                    } else {
                                        
                                        $('body').append('<div class="success_wrapper_note"><div class="success_in_cart"></div></div>');

                                        var html = '<div class="in_cart_content">';
                                        html +=  json['error'];
                                        html += '</div>';                            

                                        $('.success_in_cart').html(html);

                                        $('.success_wrapper_note').animate({top:'-=10px',opacity:'1'},150);

                                        setTimeout(function(){
                                            $('.success_wrapper_note').fadeOut(300);
                                            $('.success_wrapper_note').remove();
                                        },3000);
                                    }
                                }

                            }

                        });
                 
  
                 
                    return false;

                }
                if($(this).val().length >= 14){

                    return false;

                }

            }
            if($('.select_numberformat option:checked').attr('value') == 'kz'){
                if($(this).val().length >= 14){


                    //отправляем звонок


                     //отправляем звонок

        
                        $.ajax({
                            url: 'index.php?route=account/account/auth',
                            type: 'post',
                            data: {telephone: $('.select_numberformat option:checked').text().trim() + ' ' + $(this).val()},
                            dataType: 'json',
                            beforeSend: function(data) {
                                console.log(data);
                            },
                            success: function(json) {
                                if(json['response']) {
                                    if(json['response']['request_id']){
                                        var code = json['response']['code'];

                                        $('.cur_telephone_info .you_phone').html(json['telephone']); 

                                        console.log(code);

                                        $('p.р1_subtitle').hide();

                                        $('.back_to_page').addClass('page_2');
                                        $('.back_to_page').removeAttr('onclick');

                                        $('.page_1').hide();
                                        $('.page_2').show();
                                    } else {
                                        
                                        $('body').append('<div class="success_wrapper_note"><div class="success_in_cart"></div></div>');

                                        var html = '<div class="in_cart_content">';
                                        html +=  json['error'];
                                        html += '</div>';                            

                                        $('.success_in_cart').html(html);

                                        $('.success_wrapper_note').animate({top:'-=10px',opacity:'1'},150);

                                        setTimeout(function(){
                                            $('.success_wrapper_note').fadeOut(300);
                                            $('.success_wrapper_note').remove();
                                        },3000);
                                    }
                                }

                            }

                        });
                 
    
                 




                    }

                    if($(this).val().length >= 15){
                        return false;
                    }

            }
            if($('.select_numberformat option:checked').attr('value') == 'am'){
                if($(this).val().length >= 14){


                    //отправляем звонок

  //отправляем звонок


                        $.ajax({
                            url: 'index.php?route=account/account/auth',
                            type: 'post',
                            data: {telephone: $('.select_numberformat option:checked').text().trim() + ' ' + $(this).val()},
                            dataType: 'json',
                            beforeSend: function(data) {
                                console.log(data);
                            },
                            success: function(json) {
                                if(json['response']) {
                                    if(json['response']['request_id']){
                                        var code = json['response']['code'];

                                        $('.cur_telephone_info .you_phone').html(json['telephone']); 

                                        console.log(code);

                                        $('p.р1_subtitle').hide();

                                        $('.back_to_page').addClass('page_2');
                                        $('.back_to_page').removeAttr('onclick');

                                        $('.page_1').hide();
                                        $('.page_2').show();
                                    } else {
                                        
                                        $('body').append('<div class="success_wrapper_note"><div class="success_in_cart"></div></div>');

                                        var html = '<div class="in_cart_content">';
                                        html +=  json['error'];
                                        html += '</div>';                            

                                        $('.success_in_cart').html(html);

                                        $('.success_wrapper_note').animate({top:'-=10px',opacity:'1'},150);

                                        setTimeout(function(){
                                            $('.success_wrapper_note').fadeOut(300);
                                            $('.success_wrapper_note').remove();
                                        },3000);
                                    }
                                }

                            }

                        });
                 





                    }

                    if($(this).val().length >= 15){
                        return false;
                    }

            }
            if($('.select_numberformat option:checked').attr('value') == 'kg'){
                if($(this).val().length >= 14){


                    //отправляем звонок


                    //отправляем звонок


                        $.ajax({
                            url: 'index.php?route=account/account/auth',
                            type: 'post',
                            data: {telephone: $('.select_numberformat option:checked').text().trim() + ' ' + $(this).val()},
                            dataType: 'json',
                            beforeSend: function(data) {
                                console.log(data);
                            },
                            success: function(json) {
                                if(json['response']) {
                                    if(json['response']['request_id']){
                                        var code = json['response']['code'];

                                        $('.cur_telephone_info .you_phone').html(json['telephone']); 

                                        console.log(code);

                                        $('p.р1_subtitle').hide();

                                        $('.back_to_page').addClass('page_2');
                                        $('.back_to_page').removeAttr('onclick');

                                        $('.page_1').hide();
                                        $('.page_2').show();
                                    } else {
                                        
                                        $('body').append('<div class="success_wrapper_note"><div class="success_in_cart"></div></div>');

                                        var html = '<div class="in_cart_content">';
                                        html +=  json['error'];
                                        html += '</div>';                            

                                        $('.success_in_cart').html(html);

                                        $('.success_wrapper_note').animate({top:'-=10px',opacity:'1'},150);

                                        setTimeout(function(){
                                            $('.success_wrapper_note').fadeOut(300);
                                            $('.success_wrapper_note').remove();
                                        },3000);
                                    }
                                }

                            }

                        });
                 
              




                    }

                    if($(this).val().length >= 15){
                        return false;
                    }

            }

        });

        

        $('body').on('click','.recall_content .recall_content_item span',function(e){

            var curPhone = $('.cur_telephone_info .you_phone').text().trim();

                $.ajax({
                    url: 'index.php?route=account/account/auth',
                    type: 'post',
                    data: {telephone: curPhone},
                    dataType: 'json',
                    beforeSend: function(data) {
                        console.log(data);
                    },
                    success: function(json) {
                        $('.input_telephone_auth').removeClass('error');
                        if(json['response']) {

                            if(json['response']['request_id']){
                                var code = json['response']['code'];

                                $('.cur_telephone_info .you_phone').html(json['telephone']); 

                                console.log(code);


                                $('body').append('<div class="success_wrapper_note"><div class="success_in_cart"></div></div>');

                                var html = '<div class="in_cart_content">';
                                html +=  '<p class="desc">Отправлен повторный звонок на номер</p>';
                                html += '<p class="phone_number">'+json['telephone']+'</p>';
                                html += '</div>';                            

                                $('.success_in_cart').html(html);

                                $('.success_wrapper_note').animate({top:'-=10px',opacity:'1'},150);

                                setTimeout(function(){
                                    $('.success_wrapper_note').fadeOut(300);
                                    $('.success_wrapper_note').remove();
                                },3000);
                            } else {

                                $('.input_telephone_auth').prop('disabled',false);
                                $('select.select_numberformat').prop('disabled',false);
                                $('.input_telephone_auth').addClass('error');

                                $('body').append('<div class="success_wrapper_note"><div class="success_in_cart"></div></div>');

                                var html = '<div class="in_cart_content">';
                                html +=  json['error'];
                                html += '</div>';                            

                                $('.success_in_cart').html(html);

                                $('.success_wrapper_note').animate({top:'-=10px',opacity:'1'},150);

                                setTimeout(function(){
                                    $('.success_wrapper_note').fadeOut(300);
                                    $('.success_wrapper_note').remove();
                                },3000);
                            }
                              

                        }

                    }

                });

        });
        $('body').on('click','.repeat_callback_btn',function(e){

            var curPhone =  $('.select_numberformat option:checked').text().trim() + ' ' + $(this).val();

                $.ajax({
                    url: 'index.php?route=account/account/auth',
                    type: 'post',
                    data: {telephone: curPhone},
                    dataType: 'json',
                    beforeSend: function(data) {
                        console.log(data);
                    },
                    success: function(json) {
                        $('.input_telephone_auth').removeClass('error');
                        if(json['response']) {
               
                            if(json['response']['request_id']){
                                var code = json['response']['code'];

                                $('.cur_telephone_info .you_phone').html(json['telephone']); 

                                console.log(code);


                                $('body').append('<div class="success_wrapper_note"><div class="success_in_cart"></div></div>');

                                var html = '<div class="in_cart_content">';
                                html +=  '<p class="desc">Отправлен повторный звонок на номер</p>';
                                html += '<p class="phone_number">'+json['telephone']+'</p>';
                                html += '</div>';                            

                                $('.success_in_cart').html(html);

                                $('.success_wrapper_note').animate({top:'-=10px',opacity:'1'},150);

                                setTimeout(function(){
                                    $('.success_wrapper_note').fadeOut(300);
                                    $('.success_wrapper_note').remove();
                                },3000);
                            } else {
                                $('body').append('<div class="success_wrapper_note"><div class="success_in_cart"></div></div>');

                                var html = '<div class="in_cart_content">';
                                html +=  json['error'];
                                html += '</div>';                            

                                $('.success_in_cart').html(html);

                                $('.success_wrapper_note').animate({top:'-=10px',opacity:'1'},150);

                                setTimeout(function(){
                                    $('.success_wrapper_note').fadeOut(300);
                                    $('.success_wrapper_note').remove();
                                },3000);

                                $('.input_telephone_auth').prop('disabled',false);
                                $('select.select_numberformat').prop('disabled',false);
                                $('.input_telephone_auth').addClass('error');
                              
                                
                            }
                              

                        }

                    }

                });
                return false;
        });

        $('body').on('click','.back_to_page.page_2',function(e){

            $('p.р1_subtitle').show();

            $('.page_1').show();

            $('.page_2').hide();

            $('.back_to_page').removeClass('page_2');
            $('.back_to_page').attr('onclick','history.back()');

            e.preventDefault();

            return false;

        });

        $('.page_2 .input_pincode input').keyup(function(e){
            var $wrap = $(this).closest('.input_pincode');
            var $inputs = $wrap.find('input');	
            var val = $(this).val();
            
            // Ввод только цифр
            if(val == val.replace(/[0-9]/, '')) {
                $(this).val('');
                return false;
            }
            
            // Передача фокуса следующему innput
            $inputs.eq($inputs.index(this) + 1).focus();
        
            // Заполнение input hidden
            var fullval = '';
            $inputs.each(function(){
                fullval = fullval + (parseInt($(this).val()) || '0');
            });
            console.log('full');
            if(fullval.length == 4){

                var i = 0;
                $inputs.each(function(){
                    if($(this).val() != ''){
                        i++;
                    }
                });

               if(i == 4){

                    var input_pincode = fullval;
                    // var currenPhone = $('.cur_telephone_info .you_phone').text().trim();
                    var currenPhone = '79209089412';
                    //отправляем данные для проверки

                    var typeAuth = "<?php echo $typeAuth; ?>";


     
                    $.ajax({
                        url: 'index.php?route=account/account/sendPinCodeAuth',
                        type: 'post',
                        data: {telephone: currenPhone,code:input_pincode,typeAuth:typeAuth},
                        dataType: 'json',
                        beforeSend: function(data) {
                            console.log(data);
                        },
                        success: function(json) {
                           
                            console.log(json);
                            if(json['redirect']){
                                document.location.href = json['redirect'];
                            }

                        }

                    });

               }
        
            }

        });
});

</script>

<?php echo $footer; ?>
