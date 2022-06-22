// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Todolist {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) external {
        todos.push(Todo({
            text:_text,
            completed:false
        }));
    }

    function update(uint _index, string calldata _text, bool _status) external {
        // 如果有多個要存可用 storage 來節省 gas
        // ex:
        Todo storage todo = todos[_index];
        todo.text = _text;
        todo.completed = _status;

        // todos[_index].text = _text;
        // todos[_index].completed = _status;
    }

    function get(uint _index) external view returns (string memory , bool){
        // 這裡 gas 的花費 storage 會比 memory 少 , 原因是 memory 會多複製一次 (看個人喜好)    

        Todo memory todo = todos[_index];
        return (todo.text,todo.completed);
    }

    function toggleCompleted(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }
}