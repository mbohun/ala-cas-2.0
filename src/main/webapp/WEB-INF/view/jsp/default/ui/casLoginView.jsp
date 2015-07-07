<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="includes/top.jsp" />
        <div id="header" class="row-fluid">
            <h1>Login</h1>
        </div><!--close header-->
        </header>
        <div class="row-fluid" >
            <div class="span4">
                <script type="text/javascript">
                    $(document).ready(function() {
                        $("input#username").focus();
                    });
                    function setUserNameLc() {
                        $("input#username").val(function() {
                            return $("input#username").val().toLowerCase();
                        });
                    }
                </script>
                <form:form method="post" id="fm1" cssClass="fm-v clearfix" commandName="${commandName}" htmlEscape="true" onsubmit="setUserNameLc()">
                    <form:errors path="*" cssClass="errors" id="status" element="div" />
                    <div class="box fl-panel" id="login">
                    <!-- <spring:message code="screen.welcome.welcome" /> -->
                        <h2><spring:message code="screen.welcome.instructions" /></h2>
                        <div class="row fl-controls-left">
                            <label for="username" class="fl-label"><spring:message code="screen.welcome.label.netid" /></label>
                            <c:if test="${not empty sessionScope.openIdLocalId}">
                            <strong>${sessionScope.openIdLocalId}</strong>
                            <input type="hidden" id="username" name="username" value="${sessionScope.openIdLocalId}" />
                            </c:if>

                            <c:if test="${empty sessionScope.openIdLocalId}">
                            <spring:message code="screen.welcome.label.netid.accesskey" var="userNameAccessKey" />
                            <form:input cssClass="required" cssErrorClass="error" id="username" size="32" tabindex="1" accesskey="${userNameAccessKey}" path="username" autocomplete="false" htmlEscape="true"  value="${param.email}"/>
                            </c:if>
                        </div>
                        <div class="row fl-controls-left">
                            <label for="password" class="fl-label"><spring:message code="screen.welcome.label.password" /></label>
                            <%--
                            NOTE: Certain browsers will offer the option of caching passwords for a user.  There is a non-standard attribute,
                            "autocomplete" that when set to "off" will tell certain browsers not to prompt to cache credentials.  For more
                            information, see the following web page:
                            http://www.geocities.com/technofundo/tech/web/ie_autocomplete.html
                            --%>
                            <spring:message code="screen.welcome.label.password.accesskey" var="passwordAccessKey" />
                            <form:password cssClass="required" cssErrorClass="error" id="password" size="32" tabindex="2" path="password"  accesskey="${passwordAccessKey}" htmlEscape="true" autocomplete="off" />
                        </div>
                        <div class="row check">
                            <%--
                            <input id="warn" name="warn" value="true" tabindex="3" accesskey="<spring:message code="screen.welcome.label.warn.accesskey" />" type="checkbox" />
                            <label for="warn"><spring:message code="screen.welcome.label.warn" /></label>
                            --%>
                            <input type="checkbox" name="rememberMe" id="rememberMe" value="true" style="vertical-align: initial; left: 0px;"/>
                            <label for="rememberMe" style="display:inline-block; float:none; width: auto;">Remember Me</label>
                        </div>
                        <div class="row btn-row">
                            <input type="hidden" name="lt" value="${flowExecutionKey}" />
                            <input type="hidden" name="_eventId" value="submit" />

                            <input class="btn btn-primary" name="submit" accesskey="l" value="<spring:message code="screen.welcome.button.login" />" tabindex="4" type="submit" />
                            <input class="btn btn-link" name="reset" accesskey="c" value="<spring:message code="screen.welcome.button.clear" />" tabindex="5" type="reset" />
                        </div>
                    </div>
                </form:form>
            </div><!--close column-one-->
            <div id=span6>
            <div class="inner">
                <p><spring:message code="screen.welcome.security" /></p>
                <h2><spring:message code="screen.welcome.registered" text="Register"/></h2>
                <p><spring:message code="screen.welcome.notRegistered" arguments="${properties['userdetails.url']}/registration/createAccount"/></p>
                <h2><spring:message code="screen.welcome.forgottenpassword.hdr" text="Forgotten password ?"/></h2>
                <p><spring:message code="screen.welcome.forgottenpassword" arguments="${properties['userdetails.url']}/registration/forgottenPassword"/></p>
            </div><!--close section-->
        </div><!--close column-two-->
        </div><!--close section-->
<jsp:directive.include file="includes/bottom.jsp" />

<a href="${FacebookClientUrl}">Authenticate with Facebook</a> <br />
<br />
<a href="${TwitterClientUrl}">Authenticate with Twitter</a><br />
<br />
<!-- NOTE: pac4j 1.4.x uses hardoced GitHub OAuth scope 'user'; although the scope 'user:email'
     is a part/subset of the scope 'user' requesting 'user:email' scope restricts the
     required permissions to a read-only access to the user's email address.
-->
<a href="${GitHubClientUrl}&scope=user:email">Authenticate with GitHub</a><br />
<br />
<a href="${Google2ClientUrl}">Authenticate with Google</a><br />
<br />
<a href="${LinkedIn2ClientUrl}">Authenticate with LinkedIn</a><br />
<br />
<!-- NOTE: in order to access the email address you need to request the OAuth scope 'wl.emails';
     pac4j 1.4.2-SNAPSHOT has currently (as of 2015-06-13) hardcoded scope 'wl.basic'
-->
<a href="${WindowsLiveClientUrl}&scope=wl.emails">Authenticate with Windows Live</a><br />
<br />
