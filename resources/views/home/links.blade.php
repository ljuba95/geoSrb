<div>
<div>
    
<form action="http://www.geosrbija.rs/rga/rga_metadatabrowser.aspx?gui=1&lang=3">
    <!-- <input type="submit" value="Pregled metapodataka" /> -->
   <button type="submit">Pregled metapodataka</button>
</form> 

<form action="https://a3.geosrbija.rs/">
   
    <button type="submit">Kartografski pregled</button>
</form>
</div>
<div>
<p class="higlight-title" style="text-align: center; font-size: 20px">
    
        <b>@lang('main.links')</b>
</p>

<div class="higlight-border">
    @foreach($linkGroups as $group)
        <b>{{ $group->name }}</b>
        <table cellpadding="3px" cellspacing="0" width="100%">
            @foreach($group->links as $link)

            <tr>
                <td class="td">
                    <a id="ctl00_ContentPlaceHolder1_ucLinksByCategory_repList_ctl00_repDetail_ctl01_HyperLink1"
                       class="link-normal" href="{{$link->url}}">{{$link->name}}</a>
                </td>
            </tr>

            @endforeach
        </table>
    @endforeach

</div>
</div>
</div>

