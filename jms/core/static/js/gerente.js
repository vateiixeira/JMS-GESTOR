var app = new Vue({
    el: '#app',
    delimiters: ['[[', ']]'],
    data: {
      message: 'Olá Vue!'
    },
    methods: {
        desempenho: function () {
            alert('deu certo')
        }
    }
  })
