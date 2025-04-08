<div class="input-group">
    <form
        method="GET"
        role="search"
        id="search-form"
        action="{{ route('velocity.search.index') }}">
        <div
            class="btn-toolbar full-width search-form"
            role="toolbar">

            <searchbar-component>
                <template v-slot:image-search>
                    <image-search-component
                        status="{{core()->getConfigData('general.content.shop.image_search') == '1' ? 'true' : 'false'}}"
                        upload-src="{{ route('shop.image.search.upload') }}"
                        view-src="{{ route('shop.search.index') }}"
                        common-error="{{ __('shop::app.common.error') }}"
                        size-limit-error="{{ __('shop::app.common.image-upload-limit') }}">
                    </image-search-component>
                </template>
            </searchbar-component>

        </div>
    </form>
</div>
@push('scripts')
<script type="text/javascript">
        //   window.onload = function() {
        //     if (document.readyState === 'complete') {
        //        console.log("complete");
        //         cat = document.getElementsByName("category")[0];
        //         //children  = cat.get(6);
        //         //cat.children[6].selected = 'selected';
        //          console.log(cat);
        //       } 
        //    // cat = document.getElementsByName("category");
        //     //.children[6].selected = 'selected'
        //    // console.log(cat[1]);
        //    //document.getElementsByName("category").findCh
        //    //.children[6].setAttribute('selected', true);
        // }
        document.addEventListener('readystatechange', e => {
              if(document.readyState === "complete"){
                  setTimeout(() => {
                    cat = document.getElementsByName("category")[1];
                    console.log(cat.children[6]);
                    cat.children[6].setAttribute('selected','selected');
                  }, 2265);
              }
        });
    </script>
@endpush