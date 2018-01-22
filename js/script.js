// Generated by CoffeeScript 1.12.7
(function() {
  $(document).ready(function() {
    var c, canvas;
    canvas = document.querySelector("canvas");
    c = canvas.getContext("2d");
    c.beginPath();
    c.lineWidth = 0.2;
    c.moveTo(136.5, 58);
    c.lineTo(260, 20);
    c.lineTo(300.5, 20);
    c.stroke();
    c.moveTo(186.5, 67);
    c.lineTo(260, 40);
    c.lineTo(308.5, 40);
    c.stroke();
    c.moveTo(210.5, 75);
    c.lineTo(260, 58);
    c.lineTo(314.5, 58);
    c.stroke();
    c.moveTo(216.5, 89);
    c.lineTo(260, 77);
    c.lineTo(324.5, 77);
    c.stroke();
    $('#firstComponent').addClass('componentDetails--disable');
    $('.lable_listItem').on("click", function() {
      var activePoint, compElement, compositionSec, elements, i, j, len, len1, pivotPointList, results;
      $('.lable_listItem').removeClass('active');
      $('.composition_imageLink').removeClass('active');
      activePoint = $(this).attr('pivotPoint');
      pivotPointList = $('.composition_image').find('.composition_imageLink');
      for (i = 0, len = pivotPointList.length; i < len; i++) {
        elements = pivotPointList[i];
        if (activePoint === $(elements).attr("pivotPoint")) {
          $(elements).addClass('active');
          $(this).toggleClass('active');
        }
      }
      compositionSec = $('.componentDetails');
      results = [];
      for (j = 0, len1 = compositionSec.length; j < len1; j++) {
        compElement = compositionSec[j];
        if (activePoint === $(compElement).attr('relPoint')) {
          results.push($(compElement).removeClass("componentDetails--disable"));
        } else {
          results.push($(compElement).addClass("componentDetails--disable"));
        }
      }
      return results;
    });
    $('.crossButton').on('click', function(e) {
      var elements, i, j, labelList, len, len1, pivotPointList, results;
      e.preventDefault();
      $(this).parent().parent().addClass('componentDetails--disable');
      $(this).parent().find(".componentDetails_wrapper").css({
        "display": "none"
      });
      $(this).css({
        "display": "none"
      });
      pivotPointList = $('.composition_image').find('.composition_imageLink');
      for (i = 0, len = pivotPointList.length; i < len; i++) {
        elements = pivotPointList[i];
        if ($(this).parent().parent().attr('relPoint') === $(elements).attr('pivotPoint')) {
          $(elements).removeClass('active');
        }
      }
      labelList = $('.composition_image').find('.lable_listItem');
      results = [];
      for (j = 0, len1 = labelList.length; j < len1; j++) {
        elements = labelList[j];
        if ($(this).parent().parent().attr('relPoint') === $(elements).attr('pivotPoint')) {
          results.push($(elements).removeClass('active'));
        } else {
          results.push(void 0);
        }
      }
      return results;
    });
    return $(".componentsHeading h3").on("click", function() {
      var elements, i, j, labelList, len, len1, pivotPointList, results;
      $(this).parent().parent().removeClass("componentDetails--disable");
      $(this).parent().parent().siblings('div').addClass("componentDetails--disable");
      $(this).siblings('.crossButton').css({
        "display": "block"
      });
      $(this).parent().parent().siblings('div').find('a').css({
        "display": "none"
      });
      pivotPointList = $('.composition_image').find('.composition_imageLink');
      for (i = 0, len = pivotPointList.length; i < len; i++) {
        elements = pivotPointList[i];
        if ($(this).parent().parent().attr('relPoint') === $(elements).attr('pivotPoint')) {
          $(elements).addClass('active');
        } else {
          $(elements).removeClass('active');
        }
      }
      labelList = $('.composition_image').find('.lable_listItem');
      results = [];
      for (j = 0, len1 = labelList.length; j < len1; j++) {
        elements = labelList[j];
        if ($(this).parent().parent().attr('relPoint') === $(elements).attr('pivotPoint')) {
          results.push($(elements).addClass('active'));
        } else {
          results.push($(elements).removeClass('active'));
        }
      }
      return results;
    });
  });

}).call(this);