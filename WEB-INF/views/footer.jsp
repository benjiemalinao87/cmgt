<%@page contentType="text/html" pageEncoding="UTF-8"%>
            <hr>
            <footer>
                <div class="row">
                    <div class="col-lg-12">
                        <p class="text-center">
                            Credentials Management Copyright &copy; 2017 TheBhadzTech
                        </p>
                    </div>
                </div>
            </footer>
        </div>
        <script type="text/javascript">
            var csrfHeader = $("meta[name='_csrf']").attr("content");
            var csrfToken = $("meta[name='_csrf_header']").attr("content");
            function postLogout() {
                $("#frmLogout").submit();
            }
        </script>
    </body>
</html>
