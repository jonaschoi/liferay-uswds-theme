<nav aria-label="<@liferay.language key="site-pages" />" class="usa-nav">
	<button class="usa-nav__close"><img src="${images_folder}/uswds/close.svg" alt="close"></button>

	<ul class="usa-nav__primary usa-accordion">
		<#list nav_items as nav_item>
			<#assign
				nav_item_attr_has_popup = ""
				nav_item_css_class = ""
				nav_item_layout = nav_item.getLayout()
			/>

			<#if nav_item.isSelected()>
				<#assign
					nav_item_attr_has_popup = "aria-haspopup='true'"
					nav_item_css_class = "usa-current"
				/>
			</#if>

			<li class="usa-nav__primary-item" id="layout_${nav_item.getLayoutId()}" role="presentation">
				<#if !nav_item.hasChildren()>
					<a
						class="usa-nav__link ${nav_item_css_class}" 
						href="${nav_item.getURL()}"
					>
						<span><@liferay_theme["layout-icon"] layout=nav_item_layout /> ${nav_item.getName()}</span>
					</a>
				<#else>
					<button
						${nav_item.getTarget()}
						${nav_item_attr_has_popup}
						aria-controls="nav-section-${nav_item.getLayoutId()}"
						aria-expanded="false"
						aria-labelledby="layout_${nav_item.getLayoutId()}"
						class="usa-accordion__button usa-nav__link ${nav_item_css_class}"
						role="menuitem"
					>
						<span><@liferay_theme["layout-icon"] layout=nav_item_layout /> ${nav_item.getName()}</span>
					</button>

					<ul id="nav-section-${nav_item.getLayoutId()}" class="usa-nav__submenu" hidden="">
						<#list nav_item.getChildren() as nav_child>
							<#assign
								nav_child_css_class = ""
							/>

							<#if nav_item.isSelected()>
								<#assign
									nav_child_css_class = "selected"
								/>
							</#if>

							<li
								class="usa-nav__submenu-item ${nav_child_css_class}"
								id="layout_${nav_child.getLayoutId()}"
								role="presentation"
							>
								<a
									aria-labelledby="layout_${nav_child.getLayoutId()}"
									href="${nav_child.getURL()}"
									${nav_child.getTarget()}
									role="menuitem"
								>${nav_child.getName()}</a>
							</li>
						</#list>
					</ul
				</#if>
			</li>
		</#list>
	</ul>
</nav>