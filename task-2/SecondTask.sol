// "SPDX-License-Identifier: MIT";
pragma solidity ^0.8.0;

contract ToDoList{
    
    struct ToDo{
        string text;
        bool completed;
    }

    //Named the todo struct.
    ToDo[] public todos;

    //Create todo-list and given text variable
    function CreateTodo(string calldata _text) external {
        todos.push(ToDo({
            text:_text,
            completed: false
        }));
    }
    //Update text of todo by index
    function updateTodo(uint index,string calldata _text) external{
        todos[index].text = _text;
    }
    //Get variable value of todo by index
    function getTodo(uint _index) external view returns(string memory, bool){
        ToDo memory todo = todos[_index];
        return (todo.text, todo.completed);
    }
    //Todo change completed variables.
    function toggleCompleted(uint _index) external{
        todos[_index].completed = !todos[_index].completed;
    }
}