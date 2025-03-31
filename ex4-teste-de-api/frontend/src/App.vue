<template>
  <div>
    <h1>Buscar Operadoras</h1>
    <input v-model="query" placeholder="Digite o nome da operadora" />
    <button @click="buscar">Buscar</button>
    
    <ul>
      <li v-for="operadora in operadoras" :key="operadora.id">
        {{ operadora.nome }}
      </li>
    </ul>
    
    <div v-if="total > pageSize">
      <button :disabled="page === 1" @click="page--">Anterior</button>
      <span>Página {{ page }}</span>
      <button :disabled="page * pageSize >= total" @click="page++">Próximo</button>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      query: '',
      operadoras: [],
      page: 1,
      pageSize: 10,
      total: 0
    };
  },
  methods: {
    async buscar() {
      try {
        const response = await axios.get('http://127.0.0.1:8000/buscar', {
          params: { query: this.query, page: this.page, page_size: this.pageSize }
        });
        this.operadoras = response.data.results;
        this.total = response.data.total;
      } catch (error) {
        console.error('Erro ao buscar operadoras:', error);
      }
    }
  }
};
</script>
