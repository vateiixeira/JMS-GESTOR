var app = new Vue({
    el: '#app',
    delimiters: ['[[', ']]'],
    data: {
      message: 'Olá Vue!'
    },
    methods: {
        desempenho: function () {
            var vendedor = 'Paulo'
            this.$('#nome-vendedor') = 'asdadasd'
            alert('deu certo')
        }
    }
  })
