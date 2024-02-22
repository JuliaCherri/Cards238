//<?php

/**
 * Cards238
 * 
 * Открытка на 23.02 и 08.03
 * 
 * @category    plugin
 * @internal    @events OnManagerWelcomeHome
 */

 $params = $modx->event->params;
 $col_lg = isset($params["col_lg"]) ? (int)$params["col_lg"] : 6;
 $menu_index = isset($params["menu_index"]) ? (int)$params["menu_index"] : 10;
 $hide_menu = isset($params["hide_menu"]) ? (int)$params["hide_menu"] : 0;
 
 $outs=array();
 $outs['23']=array(
     'date' => "02/23",
     'title' => '23 февраля',
     'content' => '<div class="cards23 card-body">
            <div class="cards23_text">С Днем защитника Отечества!</div>
            <div class="cards23_star"><i class="fa fa-star"></i></div>
            <div class="cards23_leaf1"><i class="fa fa-leaf"></i></div>
            <div class="cards23_leaf2"><i class="fa fa-leaf"></i></div>
            <div class="cards23_leaf3"><i class="fa fa-leaf"></i></div>
            <div class="cards23_dove"><i class="fa fa-dove"></i></div>
        </div>',
     'style' => '<style>
     .widgets #cards238 .cards23 {padding: 0 0 272px;text-align: center;position:relative;overflow:hidden;display: flex;justify-content: center;align-items: center;}
     .cards23_text{font-size: 2rem;line-height: 1.4;padding: 1rem;text-wrap: balance;}
     .cards23_star{display: block;position: absolute;bottom: -64px;left: -106px;color: #d93240;font-size: 224px;z-index:5;}
     .cards23_leaf1{display: block;position: absolute;bottom: -112px;left: 54px;color: #17a697;font-size: 176px;z-index:6;}
     .cards23_leaf2{display: block;position: absolute;bottom: -12.8px;left: 66.8px;color: #2ac3b3;font-size: 134.4px;z-index:4;}
     .cards23_leaf3{display: block;position: absolute;bottom: 51.2px;left: 44.4px;color: #50d7c9;font-size: 121.6px;z-index:3;}
     .cards23_dove{display: block;position: absolute;bottom: 176px;left: 60.4px;color: #8fd4d9;font-size: 73.6px;z-index:3;}
     @media (min-width:576px){
         .widgets #cards238 .cards23 {padding: 0 0 50px 190px;min-height: 299px;}
     }
     @media (min-width:768px){
         .widgets #cards238 .cards23 {padding: 0 0 50px 230px;min-height: 291px;}
         .cards23_text{font-size: 2.5rem;}
     }
     @media (min-width:992px) and (max-width: calc(1200px - 1px)){
         .cards23_text{font-size: 2.0rem;}
     }
     </style>',
 );
 $outs['8']=array(
     'date' => "03/08",
     'title' => '8 марта',
     'content' => '<div class="cards8 card-body">
             <div class="cards8_text">С Международным женским днем!</div>
             <div class="cards8_spa1"><i class="fa fa-spa"></i></div>
             <div class="cards8_spa2"><i class="fa fa-spa"></i></div>
             <div class="cards8_spa3"><i class="fa fa-spa"></i></div>
             <div class="cards8_spa4"><i class="fa fa-spa"></i></div>
             <div class="cards8_spa5"><i class="fa fa-spa"></i></div>
             <div class="cards8_seedling"><i class="fa fa-seedling"></i></div>
         </div>',
     'style' => '<style>
             .widgets #cards238 .cards8 {padding: 0 0 272px;text-align: center;position:relative;overflow:hidden;display: flex;justify-content: center;align-items: center;}
             .cards8_text{font-size: 2rem;line-height: 1.4;padding: 1rem;z-index:10;text-wrap: balance;}
             .cards8_spa1{display: block;position: absolute;bottom: -30px;left: -11px;color: hsl(349.09deg 98.94% 62.94%);font-size: 144px;z-index:6;}
             .cards8_spa2{display: block;position: absolute;bottom: 37px;left: 113px;color: hsl(349 99% 74% / 1);font-size: 104px;z-index:5;}
             .cards8_spa3{display: block;position: absolute;bottom: 60px;left: -60px;color: hsl(349 99% 85% / 1);font-size: 96px;z-index:4;}
             .cards8_spa4{display: block;position: absolute;bottom: 71px;left: -38px;color: #FF789A;font-size: 139.6px;z-index:3;}
             .cards8_spa5{display: block;position: absolute;bottom: 70px;left: 63px;color: hsl(344.89deg 100% 89.7%);font-size: 136px;z-index:2;}
             .cards8_seedling{display: block;position: absolute;bottom: -224px;left: -42px;color: #c8c8a9;font-size: 280px;z-index:1;}
             @media (min-width:576px){
                 .widgets #cards238 .cards8 {padding: 0 0 50px 242px;min-height: 299px;}
                 .cards8_text{font-size: 1.8rem;}
             }
             @media (min-width:768px){
                 .widgets #cards238 .cards8 {padding: 0 0 50px 171px;min-height: 291px;}
                 .cards8_text{font-size: 2.5rem;}
             }
             @media (min-width:992px) and (max-width: calc(1200px - 1px)){
                 .cards8_text{font-size: 2.0rem;}
             }
         </style>',
 );
 
 $out=false;
 foreach($outs as $o){
     $date=strtotime($o['date']);
     $current=time();
     if(strtotime('-2 days',$date)<=$current && strtotime('3 days',$date)>=$current) $out=$o;
 }
 
 if($out!==false){
     $widgets['cards238'] = [
         'menuindex' => $menu_index,
         'id'        => 'cards238',
         'cols'      => 'col-lg-' . $col_lg,
         'icon'      => 'fa-star',
         'title'     => $out['title'],
         'body'      => $out['content'].$out['style'],
         'hide'      => $hide_menu
     ];
 }
 $modx->event->addOutput(serialize($widgets));