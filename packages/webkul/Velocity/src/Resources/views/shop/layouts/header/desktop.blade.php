<div>
    <sidebar-header heading= "{{ __('velocity::app.menu-navbar.text-category') }}">

        {{-- this is default content if js is not loaded --}}
        <div class="main-category fs16 unselectable fw6 left">
            <i class="rango-view-list align-vertical-top fs18"></i>

            <span class="pl5">{{ __('velocity::app.menu-navbar.text-category') }}</span>
        </div>

    </sidebar-header>
</div>

<div class="content-list right">
      <ul class="no-margin">
            <li><a href="#"> Hình Icons 222</a></li>
            <li><a href="#"> Hình 3D </a></li>
            <li><a href="#"> Animations</a></li>
            <li><a href="#"> Thiệp Gift</a></li>
            <li><a href="#"> Dịch vụ thiết kế</a></li>
            <li><a href="#"> Gói Cước</a></li>
     </ul>
    <!-- <right-side-header :header-content="{{ json_encode(app('Webkul\Velocity\Repositories\ContentRepository')->getAllContents()) }}">

        {{-- this is default content if js is not loaded --}}
        <ul type="none" class="no-margin">
            <li>1111</li>
        </ul>

    </right-side-header> -->
</div>