<jsp:include page="../header.jsp">
	<jsp:param value="Member" name="HTMLtitle" />
</jsp:include>

 <main class="bg1 align-center justify-center">

        <div class="align-center util-card flex-col">
            <img src="/assets/images/Access-Denied.svg" alt="Confirmation" width="400" height="300" />
            <p class="hFont text-align-center">Access Denied
            </p>
            <p class="pFont text-align-center util-text">You do not have permissions to access this page
            </p>
            <button  class="btnAnimation pFont text-deco-none" onclick="history.back()">Go back</button>
        </div>

    </main>

<jsp:include page="../footer.jsp"></jsp:include>