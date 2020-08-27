<div class="top_nav">

    <div class="nav_menu">
    
        <div class="nav toggle" style="padding: 8px;">
			<a id="menu_toggle"><i class="fa fa-bars"></i></a>
        </div>
        
        <nav class="nav navbar-nav">
            
            <ul class=" navbar-right">
            
                <li class="nav-item dropdown open" style="padding: 8px;">
                    
                	<a href="javascript:;" class="user-profile dropdown-toggle" aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown" aria-expanded="false">반갑습니다 관리자님!</a>
                    
                    <div class="dropdown-menu dropdown-usermenu pull-right" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="javascript:"> Profile</a>
                        <a class="dropdown-item" href="javascript:">
                            <span class="badge bg-red pull-right">50%</span>
                            <span>Settings</span>
                        </a>
                        <a class="dropdown-item" href="javascript:;">Help</a>
                        <a class="dropdown-item" href="/logout"><i class="fa fa-sign-out pull-right"></i> Log Out</a>
                        <ul>
							
                            <a href="#">
                            	<#if springMacroRequestContext.getLocale()?has_content && springMacroRequestContext.getLocale() == 'ko'>
                                    KR
                                </#if>
                                <#if springMacroRequestContext.getLocale()?has_content && springMacroRequestContext.getLocale() == 'en'>
                                    EN
                                </#if>
                                <#if springMacroRequestContext.getLocale()?has_content && springMacroRequestContext.getLocale() == 'cn'>
                                    CN
                                </#if>
                            </a>
                            
                            <ul>
                                <li><a href="?lang=ko">KR</a></li>
                                <li><a href="?lang=en">EN</a></li>
                                <li><a href="?lang=cn">CN</a></li>
                            </ul>
                            
                        </ul>
						
                    </div>
                </li>
				
                <li role="presentation" class="nav-item dropdown open" style="padding: 8px">
                    
                    <a href="javascript:;" class="dropdown-toggle info-number" id="navbarDropdown1" data-toggle="dropdown" aria-expanded="false">
                        <i class="fa fa-envelope-o"></i>
                        <span class="badge bg-green">6</span>
                    </a>
                    
                    <ul class="dropdown-menu list-unstyled msg_list" role="menu"
                        aria-labelledby="navbarDropdown1">
                        
						<li class="nav-item">
							<a class="dropdown-item">
								<span class="image"><img src="images/Ryan.png"/></span>
								<span>
								<span>라이언</span>
								<span class="time">3분 전</span>
								</span>
								<span class="message">안녕하세요 라이언입니다.</span>
							</a>
                        </li>
                        
                        <li class="nav-item">
							<a class="dropdown-item">
								<span class="image"><img src="images/Muzi.png"/></span>
								<span>
								<span>무지</span>
								<span class="time">5분 전</span>
								</span>
								<span class="message">안녕하세요 무지입니다.</span>
							</a>
                        </li>
                        
                        <li class="nav-item">
							<a class="dropdown-item">
								<span class="image"><img src="images/Apeach.png"/></span>
								<span>
								<span>어피치</span>
								<span class="time">7분 전</span>
								</span>
								<span class="message">안녕하세요 어피치입니다.</span>
							</a>
                        </li>
                       	
						<li class="nav-item">
							<div class="text-center">
								<a class="dropdown-item">
									<strong>See All Alerts</strong>
									<i class="fa fa-angle-right"></i>
								</a>
                            </div>
						</li>
                    </ul>
                    
                </li>

            </ul>
        </nav>

    </div>
</div>