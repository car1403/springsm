<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
  #map{
    width:600px;
    height:500px;
    border:2px solid darkred;
  }
</style>

<script>
  let map1 = {
    map:null,
    init:function(){
      this.makemap();
      $('#sbtn').click(()=>{
        this.goseoul();
      });
      $('#bbtn').click(()=>{
        this.gobusan();
      });
      $('#jbtn').click(()=>{
        this.gojeju();
      });
    },
    makemap:function(){
      let mapContainer = document.getElementById('map');
      let mapOption = {
        center: new kakao.maps.LatLng(36.799165, 127.074981),
        level: 5
      };
      this.map = new kakao.maps.Map(mapContainer, mapOption);
      var mapTypeControl = new kakao.maps.MapTypeControl();
      this.map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
      var zoomControl = new kakao.maps.ZoomControl();
      this.map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

      var markerPosition  = new kakao.maps.LatLng(36.799165, 127.074981);
      var marker = new kakao.maps.Marker({
        position: markerPosition
      });
      marker.setMap(this.map);

      let iwContent = '<div style="padding:5px;">Hello World! <br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>';
      let iwPosition = new kakao.maps.LatLng(36.799165, 127.074981); //인포윈도우 표시 위치입니다
      let infowindow = new kakao.maps.InfoWindow({
        position : iwPosition,
        content : iwContent
      });
      kakao.maps.event.addListener(marker,'mouseover',overHandler(this.map,marker,infowindow));
      kakao.maps.event.addListener(marker,'mouseout',outHandler(infowindow));

      function overHandler(map,marker,infowindow){
        return function(){
          infowindow.open(map, marker);
        };
      };
      function outHandler(infowindow){
        return function(){
          infowindow.close();
        };
      };



    },
    goseoul:function(){
      // 37.554472, 126.980841
      var moveLatLon = new kakao.maps.LatLng(37.554472, 126.980841);
      this.map.panTo(moveLatLon);
      var markerPosition  = new kakao.maps.LatLng(37.554472, 126.980841);
      var marker = new kakao.maps.Marker({
        position: markerPosition
      });
      marker.setMap(this.map);
    },
    gobusan:function(){
      // 35.175109, 129.175474
      var moveLatLon = new kakao.maps.LatLng(35.175109, 129.175474);
      this.map.panTo(moveLatLon);

      var markerPosition  = new kakao.maps.LatLng(35.175109, 129.175474);
      var marker = new kakao.maps.Marker({
        position: markerPosition
      });
      marker.setMap(this.map);
    },
    gojeju:function(){
      // 33.254564, 126.560944
      var moveLatLon = new kakao.maps.LatLng(33.254564, 126.560944);
      this.map.panTo(moveLatLon);

      var markerPosition  = new kakao.maps.LatLng(33.254564, 126.560944);
      var marker = new kakao.maps.Marker({
        position: markerPosition
      });
      marker.setMap(this.map);
    }
  };
  $(function(){
    map1.init();
  });
</script>

<div class="col-sm-10">

  <h2>Map1 Page</h2>
  <button id="sbtn">Seoul</button>
  <button id="bbtn">Busan</button>
  <button id="jbtn">Jeju</button>
  <div id="map"></div>

</div>