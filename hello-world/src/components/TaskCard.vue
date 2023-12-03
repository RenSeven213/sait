<template>
  <div class="task-card my-style">
    <div>
      <h4 style="margin-bottom: 4px">{{ model.title }}</h4>
      <p style="margin-bottom: 10px">{{ model.description }}</p>
      <h5>{{ model.authors }}</h5>
    </div>
    <div>
      <button @click="emitOnDone" v-if="!model.status" class="done">✅</button>
      <button @click="emitOnRemove" v-else class="remove">❌</button>
    </div>
  </div>
</template>

<script>

export default {
  emits: ['onDone', 'onRemove'],
  props: {
    model: {
      required: true,
      default: {
        id: 0,
        title: 'Создать',
        description: 'Сайт',
        authors: 'RenSeven',
        status: false
      }
    }
  },
  setup(props, { emit }) {
    const emitOnDone = () => {
      emit('onDone')
    }

    const emitOnRemove = () => {
      emit('onRemove')
    }

    return {
      emitOnDone,
      emitOnRemove
    }
  }
}
</script>

<style scoped>
.task-card {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
</style>