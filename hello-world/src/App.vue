<template>
    <nav class="navbar">
        <div class="container_nav">
            <a href="#" class="navbar-brand">
                <img src="img/logo.png" alt="">
            </a>
            <div class="navbar-wrap">
                <ul class="navbar-menu">
                    <li><a href="#">Проекты</a></li>
                </ul>
            </div>

        </div>
    </nav>
    <main>
      <div class="project">
        <span class="project_name">RimWorld</span>
      </div>
        <div class="container">
            <div class="container_menu">
                <!-- <div class="menu">
                    <span>Другие доски</span>
                </div> -->
              <div class="block">
                <div class="block_name">
                  <span>To-do list</span>
                </div>
                <TaskInput @onAddTask="addTask"></TaskInput>
                <ul class="task-list my-list">
                  <li v-for="item in taskList" :key="item.id">
                    <TaskCard @onRemove="removeTask(item.id)" @onDone="setDoneTask(item.id)" :model="item"></TaskCard>
                  </li>
                </ul>
              </div>
            </div>
        </div>
      </main>
</template>

<script>
import TaskInput from "./components/TaskInput.vue";
import TaskCard from "./components/TaskCard.vue";
import {ref} from 'vue'

export default {
  name: 'App',
  components: {
    TaskCard,
    TaskInput,
  },
  setup() {
    const taskList = ref([{id: 0, title: 'Создать', description: 'Сайт', authors: 'RenSeven', status: false}])
    
    const addTask = ({title, description, authors}) => {
      taskList.value = [...taskList.value, {id: taskList.value[taskList.value.length - 1].id + 1, title, description, authors, status: false}]
    }
    
    const setDoneTask = (id) => {
      taskList.value = taskList.value.map(x => {
        if(x.id === id)
          x.status = true
        return x
      })
    }

    const removeTask = (id) => {
      taskList.value = taskList.value.filter(x => x.id !== id)
    }

    return {
      taskList,
      addTask,
      removeTask,
      setDoneTask
    }
  }
}
</script>

<style scoped>
  .task-list {
    list-style: none;
  }
</style>