<html>

<head>
	<title><g:message code="default.welcome.title" args="[meta(name:'app.name')]"/> </title>
	<meta name="layout" content="kickstart" />
</head>

<body>

	<section id="intro" class="first">
		<h1>Welcome to Grails using Kickstart with Bootstrap</h1>
		<p>
			Congratulations, you have successfully started your first
			Grails application with the Kickstart extension! At the moment this
			is the default page, feel free to modify it to either redirect to a
			controller or display whatever content you may choose.
		</p>
		<h2>Introduction</h2>
		<p>
			Kickstart is an extension for Grails in order to start your
			project with a good looking frontend. It is intended to be used in
			rapid application scenarios such as a Startup Weekend or a
			prototyping session with a customer. This plugin provides adapted
			scaffolding templates for standard CRUD pages using the Bootstrap web
			page template by Twitter. Additionally, Kickstart includes some
			general GSPs pages (e.g., about.gsp), a minimal logging/orientation
			Filter, and a language switcher.
		</p>
		<h3>Next Steps</h3>
		<p>
			If you want to provide an authentication system I recommend 
			<a href="http://grails.org/plugin/spring-security-core">Spring Security</a>. 
			Kickstart comes with views for the login and denied views. 
		</p>
		<ol>
			<li>Enable spring-security-core in BuildConfig.groovy, e.g.: <pre>compile ":spring-security-core:1.2.7.3"</pre> </li>
			<li>Clean or compile your app to load the plugin</li>
			<li>Execute the <a href="http://grails-plugins.github.com/grails-spring-security-core/docs/manual/ref/Scripts/s2-quickstart.html">s2-quickstart script</a> to generate the required domain classes <pre>grails s2-quickstart com.yourapp User Role</pre></li>
			<ul>
				<li>BUT replace "com.yourapp" with your package structure (e.g., "com.${meta(name:'app.name')}.security")</li>
				<li>Do not overwrite the views auth.gsp and denied.gsp (or copy them again from the Kickstart plugin)</li>
			</ul>
			<li>Set security configuration in your Config.groovy (see <a href="http://grails-plugins.github.com/grails-spring-security-core/docs/manual/guide/5%20Configuring%20Request%20Mappings%20to%20Secure%20URLs.html#5.2%20Simple%20Map%20in%20Config.groovy">here</a>)</li>
		</ol>
	</section>

	<section id="info">
		<div class="row-fluid">
	    	<div class="span4">
		    	<div class="center">
					<img class="frontpageImage" src="${resource(plugin: 'kickstart-with-bootstrap', dir: 'images/frontpage',file: 'bs-docs-twitter-github.png')}" />
					<h3>Bootstrap 2.2.2</h3>
				</div>
				<p>Kickstart uses <a href ="http://twitter.github.com/bootstrap/">Bootstrap</a> to render the web pages. 
				Bootstrap is made by Mark Otto (<a href="http://twitter.com/mdo">@mdo</a>) and Billy Gates (<a href="http://twitter.com/fat">@fat</a>).
				Bootstrap is designed to help people of all skill levels as a complete kit or to start something more complex.
				</p>
			</div>
	    	<div class="span4">
		    	<div class="center">
					<img class="frontpageImage" src="${resource(plugin: 'kickstart-with-bootstrap', dir: 'images/frontpage',file: 'browser_logos.png')}" />
					<h3>Browser support</h3>
				</div>
				<p>Bootstrap is tested and supported in major modern browsers like Chrome 14, Safari 5+, Opera 11, Internet Explorer 7, and Firefox 5.</p>
			</div>
	    	<div class="span4">
		    	<div class="center">
					<img class="frontpageImage" src="${resource(plugin: 'kickstart-with-bootstrap', dir: 'images/frontpage',file: 'html5css3js8.png')}"/>
					<h3>Tech Foundation</h3>
				</div>
				<p>Bootstrap is based on elements of HTML 5, CSS 3, Javascript 1.8, and jQuery 1.7 with progressively enhanced 
				components to enable a responsive design of the website.
				Kickstart is built using Groovy 2.0 and Java 7 integrated into the Grails 2.1 framework. 
				</p>
<!-- 	                <li>Less 1.3</li> -->
			</div>
	    </div>
	</section>

	<section id="info2">
		<div class="row-fluid">
	    	<div class="span4">
		    	<div class="center">
					<img class="" src="${resource(plugin: 'kickstart-with-bootstrap', dir: 'images/frontpage',file: 'Datepicker.png')}" />
					<h3>Datepicker</h3>
				</div>
				<p>Kickstart uses the <a href ="https://github.com/eternicode/bootstrap-datepicker">Datepicker for Bootstrap</a> by Stefan Petre and Andrew Rowls</p>
			</div>
	    	<div class="span4">
		    	<div class="center">
					<img class="" src="${resource(plugin: 'kickstart-with-bootstrap', dir: 'images/frontpage',file: 'flags_preview_large.png')}" height="145"/>
					<h3>Language Selector</h3>
				</div>
				<p>Kickstart contains a language selector that uses the <a href="http://www.famfamfam.com/lab/icons/flags/">FamFamFam flag icons</a> by Mark James.
				It automatically detects which languages are available and offers them in a dropdown menu.</p>
			</div>
	    	<div class="span4">
		    	<div class="center">
					<img class="" src="${resource(plugin: 'kickstart-with-bootstrap', dir: 'images/frontpage',file: 'components.jpg')}" />
					<h3>Other Feature</h3>
				</div>
				<p>Kickstart contains several pages as starting points for the average website such as an About Page, Contact Page, 404, etc.</p>
			</div>
	    </div>
	</section>

	<section id="info3">
		<div class="row">
	    	<div class="span4">
		    	<div class="center">
					<h3>Usage</h3>
				</div>
				<p>After installation you can call the script "grails
					kickstartWithBootstrap" which will copy some files into your
					project. It will overwrite only few files (e.g., in conf, src, and
					views) - <b>you should use it only on fresh new Grails projects</b>.
				</p>
			</div>
	    	<div class="span4">
		    	<div class="center">
					<h3>Notes</h3>
				</div>
				<p></p>
				<ul>
					<li>Currently, Kickstart works with Grails 2.0 and 2.1!</li>
					<li>Kickstart only uses the CSS version of Bootstrap (currently, no less).</li>
					<li>It does NOT use the Bootstrap plugin.</li>
					<li>I18N is only available for English and German!</li>
				</ul>
			</div>
	    	<div class="span4">
		    	<div class="center">
					<h3>Terms of Use</h3>
				</div>
				<p></p>
				<ul>
					<li>Bootstrap (from Twitter): Code licensed under the Apache
						License v2.0. Documentation licensed under CC BY 3.0.
						(<a href="http://twitter.com/TwBootstrap">@TwBootstrap</a> , <a href="http://twitter.github.com/bootstrap/">http://twitter.github.com/bootstrap/</a>)</li>
					<li>Kickstart Plugins: Code licensed under the Apache License
						v2.0. Documentation licensed under CC BY 3.0. Copyright 2011 Jörg
						Rech (<a href="http://twitter.com/JoergRech">@JoergRech</a>, <a href="http://joerg-rech.com">http://joerg-rech.com</a>)</li>
				</ul>
			</div>
	    </div>

	</section>

</body>

</html>
