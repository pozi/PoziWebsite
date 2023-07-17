<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:ogc="http://www.opengis.net/ogc" xmlns:se="http://www.opengis.net/se" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.1.0">
 <NamedLayer>
  <se:Name>Accessible Parking</se:Name>
  <UserStyle>
   <se:Name>default</se:Name>
   <se:FeatureTypeStyle>
    <se:Rule>
     <se:Name>Single symbol</se:Name>
     <se:PointSymbolizer>
      <se:Graphic>
       <!--Parametric SVG-->
       <se:ExternalGraphic>
        <se:OnlineResource xlink:href="https://s3.ap-southeast-2.amazonaws.com/config.pozi.com/public/files/pozi-bubble-shadow-2.0.svg?fill=%23e15989&amp;fill-opacity=1&amp;outline=%23232323&amp;outline-opacity=1&amp;outline-width=0" xlink:type="simple"/>
        <se:Format>image/svg+xml</se:Format>
       </se:ExternalGraphic>
       <!--Plain SVG fallback, no parameters-->
       <se:ExternalGraphic>
        <se:OnlineResource xlink:href="https://s3.ap-southeast-2.amazonaws.com/config.pozi.com/public/files/pozi-bubble-shadow-2.0.svg" xlink:type="simple"/>
        <se:Format>image/svg+xml</se:Format>
       </se:ExternalGraphic>
       <!--Well known marker fallback-->
       <se:Mark>
        <se:WellKnownName>square</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#e15989</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#232323</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>50</se:Size>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <!--Parametric SVG-->
       <se:ExternalGraphic>
        <se:OnlineResource xlink:href="https://s3.ap-southeast-2.amazonaws.com/config.pozi.com/public/files/pozi-bubble-2.0.svg?fill=%231f78b4&amp;fill-opacity=1&amp;outline=%23232323&amp;outline-opacity=1&amp;outline-width=0" xlink:type="simple"/>
        <se:Format>image/svg+xml</se:Format>
       </se:ExternalGraphic>
       <!--Plain SVG fallback, no parameters-->
       <se:ExternalGraphic>
        <se:OnlineResource xlink:href="https://s3.ap-southeast-2.amazonaws.com/config.pozi.com/public/files/pozi-bubble-2.0.svg" xlink:type="simple"/>
        <se:Format>image/svg+xml</se:Format>
       </se:ExternalGraphic>
       <!--Well known marker fallback-->
       <se:Mark>
        <se:WellKnownName>square</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#1f78b4</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#232323</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>45</se:Size>
       <se:Displacement>
        <se:DisplacementX>0</se:DisplacementX>
        <se:DisplacementY>-20</se:DisplacementY>
       </se:Displacement>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <!--Parametric SVG-->
       <se:ExternalGraphic>
        <se:OnlineResource xlink:href="fontawesome-pro-6/regular/wheelchair.svg?fill=%23ffffff&amp;fill-opacity=1&amp;outline=%23232323&amp;outline-opacity=1&amp;outline-width=0" xlink:type="simple"/>
        <se:Format>image/svg+xml</se:Format>
       </se:ExternalGraphic>
       <!--Plain SVG fallback, no parameters-->
       <se:ExternalGraphic>
        <se:OnlineResource xlink:href="fontawesome-pro-6/regular/wheelchair.svg" xlink:type="simple"/>
        <se:Format>image/svg+xml</se:Format>
       </se:ExternalGraphic>
       <!--Well known marker fallback-->
       <se:Mark>
        <se:WellKnownName>square</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#ffffff</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#232323</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>21</se:Size>
       <se:Displacement>
        <se:DisplacementX>0</se:DisplacementX>
        <se:DisplacementY>-23</se:DisplacementY>
       </se:Displacement>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
   </se:FeatureTypeStyle>
  </UserStyle>
 </NamedLayer>
</StyledLayerDescriptor>
