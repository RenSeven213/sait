<template>
  <div class="task-input my-list">
    <input v-model="title" placeholder="Title" type="text">
    <input v-model="description" placeholder="Description" type="text">
    <input v-model="authors" placeholder="Authors" type="text">
    <button @click="onAddTask">Add task</button>
  </div>
</template>

<script>
import {ref} from 'vue'
export default {
  emits: {
    onAddTask({ title, description, authors }) {
      if(title === '' || description === '' || authors === '') {
        alert('Впиши больше информации')
        return false
      }
      return true
    }
  },
  setup(props, { emit }) {
    const title = ref('')
    const description = ref('')
    const authors = ref('')

    const onAddTask = () => {
      emit('onAddTask', { title: title.value, description: description.value, authors: authors.value })
    }

    return {
      title,
      description,
      authors,
      onAddTask
    }
  }
}
</script>

<style scoped>
.task-input {
  margin: 10px 0;
}
</style>