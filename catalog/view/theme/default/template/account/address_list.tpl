<?php echo $header; ?>

<link rel="stylesheet" href="/catalog/view/theme/default/stylesheet/address_page.css" />

<div class="address_list_wrapper">
  <div class="address_list_content">
    <button class="add_address_btn" onclick="document.location.href = '/address-map'">
      <svg width="11" height="10" viewBox="0 0 11 10" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M5.5 0C5.84518 0 6.125 0.279822 6.125 0.625V4.375H9.875C10.2202 4.375 10.5 4.65482 10.5 5C10.5 5.34518 10.2202 5.625 9.875 5.625H6.125V9.375C6.125 9.72018 5.84518 10 5.5 10C5.15482 10 4.875 9.72018 4.875 9.375V5.625H1.125C0.779822 5.625 0.5 5.34518 0.5 5C0.5 4.65482 0.779822 4.375 1.125 4.375H4.875V0.625C4.875 0.279822 5.15482 0 5.5 0Z" fill="#676560"></path></svg>
       добавить новый адрес
    </button>
    <div class="address_list_box">
      
      <?php if ($addresses) { ?>
        <div class="address_list">
            <?php foreach ($addresses as $result) { ?>
            <div class="address_item">
              <td class="text-left"><?php echo $result['address']; ?></td>
              <td class="text-right"><a href="<?php echo $result['update']; ?>" class="btn btn-info"><?php echo $button_edit; ?></a> &nbsp; <a href="<?php echo $result['delete']; ?>" class="btn btn-danger"><?php echo $button_delete; ?></a></td>
            </tr>
            <?php } ?>
        </div>
        <?php } else { ?>
          <p>у вас пока нет адресов</p>
          <p class="address_not_text">вы можете добавить новые <br> для оформления доставки</p>
      <?php } ?>

        
    </div>
</div>
</div>

<?php echo $footer; ?>