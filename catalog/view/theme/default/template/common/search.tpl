
<button type="button" class="btn btn-default btn-lg search_button"><img src="/image/search.svg" alt="Search"></button>

<div id="search" class="input-group">
  <div class="search_box">
    <button class="back_btn"><svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M2.48848 8.65002L6.87886 13.0404L5.95962 13.9596L0 8.00002L5.95962 2.04041L6.87886 2.95964L2.48848 7.35002H16V8.65002H2.48848Z" fill="#676560"></path></svg></button>
    <div class="search_box_content">
      <span class="input-group-btn">
        <button type="button" class="btn btn-default btn-lg"><img src="/image/search.svg" alt="Search" /></button>
      </span>
      <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_search; ?>" class="form-control input-lg" />
      <div class="close"><img src="/image/cross.svg" alt="close button"></div>
    </div>
   
  </div>

  <div class="search_content"></div>
</div>