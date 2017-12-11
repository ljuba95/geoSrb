<div>
    <div>
        <div>
            <!--<form action="http://www.geosrbija.rs/rga/rga_metadatabrowser.aspx?gui=1&lang=3">
             <input type="submit" value="Pregled metapodataka" /> -->
                <button class="btn side-button btn-success" type="submit">Pregled metapodataka</button>
           <!-- </form> -->
        </div>
        <div>
            <!--<form action="https://a3.geosrbija.rs/">-->
            
                <button class="btn side-button btn-success" type="submit">Kartografski pregled</button>
            <!--</form>-->
        </div>
    </div>
    <div>
        <p class="text"> @lang('main.links') </p>
        <div>
            @foreach($linkGroups as $group)
                <b>{{ $group->name }}</b>
                    @foreach($group->links as $link)
                <ul>
                        <a class="link" href="{{$link->url}}">{{$link->name}}</a>
                </ul>
                    @endforeach
                </table>
            @endforeach
                    
        </div>
    </div>
</div>

