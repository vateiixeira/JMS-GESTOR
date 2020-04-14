
        ref = document.referrer;
        whitelist = ['multicanais.com'];
        match = false;
        if (ref.match(/^https?:\/\/([^\/]+\.)?multicanais\.com(\/|$)/i)) {
          match = true;
        }
        if(match)
        {
              $(function() {
                $("#enviar").trigger("click");
            });
            $('#check_tokenAuth').submit(function() {
        
                event.preventDefault();
                $("#Player").addClass('show');
                grecaptcha.ready(function() {
                    grecaptcha.execute('6Lfz0a4UAAAAAAxHdPYGelnWDA1L6IOknsZNnRy9', {action: 'create_comment'}).then(function(token) {
                        $('#check_tokenAuth').prepend('<input type="hidden" name="g-recaptcha-response" value="' + token + '">');
                        $.getJSON("https://api.ipify.org?format=jsonp&callback=?",
                  function(json) {
                            $.post("https://token.multicanais.com/getAuth.php",{token: token, ip: json.ip, channel: 'globosphd', path: 'live'}, function(result) {
                                    $("#Player").removeClass('show');
                                    if(result.success == true) {
                                         if (p2pml.hlsjs.Engine.isSupported()) {
                    var engine = new p2pml.hlsjs.Engine({
          loader: {
            trackerAnnounce: [ "wss://s03.sodium.mycdn.live/"]
          },
          segments: {
            swarmId: 'liveglobosphdmulticanais'
          }
        });
                    var player = new Clappr.Player({
                        parentId: "#Player",
                        source: result.token_channel,
                        width: '100%',
                        height: "100%",
                        autoPlay: true,
                        plugins: [LogoPlugin],
                          logo: {
                        path: 'https://multicanais.com/wp-content/uploads/2019/04/logo-player.png',
                          },
                        playback: {
                            hlsjsConfig: {
                                liveSyncDurationCount: 7,
                                loader: engine.createLoaderClass()
                            }
                        }
                    });
                    p2pml.hlsjs.initClapprPlayer(player);
                    player.setVolume(50); // 1%
                    player.play();
                } else {
                    window.location.href = result.token_channel;
                }
                                    } else {
                                            alert('Erro inesperado, tente recarregar sua pagina!');
                                    }
                            });
                             }
                );
                    });;
                });
          });
            }else{
              document.getElementById("voltar").innerHTML = "";
                document.getElementById("Player").innerHTML = "<div style='text-align:center; margin:0 auto; color:#fff;'>Esta transmissão é um oferecimento de <a href='https://multicanais.com' style='text-decoration:none; color:red; font-size:20px;'>MultiCanais</a>! Acesse o site e assista gratuitamente.</span>";
              }
          