// src/screens/TodoListScreen.tsx

import React, { useState } from 'react';
import { View, Text, TextInput, Button, FlatList, StyleSheet } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';

interface Todo {
  id: string;
  title: string;
  description: string;
  completed: boolean;
}

const TodoListScreen: React.FC = () => {
  const [todos, setTodos] = useState<Todo[]>([]);
  const [title, setTitle] = useState('');
  const [description, setDescription] = useState('');

  const loadTodos = async () => {
    const storedTodos = await AsyncStorage.getItem('todos');
    if (storedTodos) {
      setTodos(JSON.parse(storedTodos));
    }
  };

  const saveTodo = async () => {
    const newTodo: Todo = {
      id: Math.random().toString(),
      title,
      description,
      completed: false,
    };

    const updatedTodos = [...todos, newTodo];
    setTodos(updatedTodos);

    await AsyncStorage.setItem('todos', JSON.stringify(updatedTodos));
  };

  const toggleComplete = async (id: string) => {
    const updatedTodos = todos.map(todo =>
      todo.id === id ? { ...todo, completed: !todo.completed } : todo
    );

    setTodos(updatedTodos);
    await AsyncStorage.setItem('todos', JSON.stringify(updatedTodos));
  };

  const renderItem = ({ item }: { item: Todo }) => (
    <View style={styles.todoItem}>
      <Text>{item.title}</Text>
      <Text>{item.description}</Text>
      <Button
        title={item.completed ? 'Desfazer' : 'Concluir'}
        onPress={() => toggleComplete(item.id)}
      />
    </View>
  );

  return (
    <View style={styles.container}>
      <Text>Lista de Tarefas</Text>
      <FlatList
        data={todos}
        keyExtractor={(item) => item.id}
        renderItem={renderItem}
      />
      <TextInput
        placeholder="Título"
        value={title}
        onChangeText={(text) => setTitle(text)}
        style={styles.input}
      />
      <TextInput
        placeholder="Descrição"
        value={description}
        onChangeText={(text) => setDescription(text)}
        style={styles.input}
      />
      <Button title="Adicionar Tarefa" onPress={saveTodo} />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  input: {
    width: '80%',
    borderWidth: 1,
    marginVertical: 10,
    padding: 8,
  },
  todoItem: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    borderWidth: 1,
    borderColor: '#ccc',
    padding: 8,
    marginVertical: 5,
    width: '80%',
  },
});

export default TodoListScreen;
