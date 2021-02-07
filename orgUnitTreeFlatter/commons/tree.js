/***********
 * 
 * This file contains function to create a tree
 * 
 * @author Ramón José Jiménez Pomareta
 * @version 4
 * @date 16.09.2020
 * 
 * 2. addded treePathsToArray
 * 3. modified treePathsToArray to include ID mode
 * 4. Adds code to the tree
 */     

var NO_ID = "NO_ID";
var LAST_LEVEL_ID = "LAST_LEVEL";
var ALL_ID = "ALL";

function Queue() {
    this._oldestIndex = 1;
    this._newestIndex = 1;
    this._storage = {};
}
 
Queue.prototype.size = function() {
    return this._newestIndex - this._oldestIndex;
};
 
Queue.prototype.enqueue = function(data) {
    this._storage[this._newestIndex] = data;
    this._newestIndex++;
};
 
Queue.prototype.dequeue = function() {
    var oldestIndex = this._oldestIndex,
        newestIndex = this._newestIndex,
        deletedData;
 
    if (oldestIndex !== newestIndex) {
        deletedData = this._storage[oldestIndex];
        delete this._storage[oldestIndex];
        this._oldestIndex++;
 
        return deletedData;
    }
};

function Node(id, code, name) {
    this.id = id;
    this.code = code;
    this.name = name;
    this.parent = null;
    this.children = [];
}
 
function Tree(id, code, name) {
    var node = new Node(id, code, name);
    this._root = node;
}
 
Tree.prototype.traverseDF = function(callback) {
 
    // this is a recurse and immediately-invoking function
    (function recurse(currentNode) {
        // step 2
        for (var i = 0, length = currentNode.children.length; i < length; i++) {
            // step 3
            recurse(currentNode.children[i]);
        }
 
        // step 4
        callback(currentNode);
 
        // step 1
    })(this._root);
 
};
 
Tree.prototype.traverseBF = function(callback) {
    var queue = new Queue();
 
    queue.enqueue(this._root);
 
    currentTree = queue.dequeue();
 
    while(currentTree){
        for (var i = 0, length = currentTree.children.length; i < length; i++) {
            queue.enqueue(currentTree.children[i]);
        }
 
        callback(currentTree);
        currentTree = queue.dequeue();
    }
};
 
Tree.prototype.contains = function(callback, traversal) {
    traversal.call(this, callback);
};
 
Tree.prototype.add = function(id, code, name, parentID, traversal) {
    var child = new Node(id, code, name),
        parent = null,
        callback = function(node) {
            if (node.id === parentID) {
                parent = node;
            }
        };
 
    this.contains(callback, traversal);
 
    if (parent) {
        parent.children.push(child);
        child.parent = parent;
    } else {
        throw new Error('Cannot add node to a non-existent parent.');
    }
};
 
Tree.prototype.remove = function(id, parentID, traversal) {
    var tree = this,
        parent = null,
        childToRemove = null,
        index;
 
    var callback = function(node) {
        if (node.id === parentID) {
            parent = node;
        }
    };
 
    this.contains(callback, traversal);
 
    if (parent) {
        index = findIndex(parent.children, id);
 
        if (index === undefined) {
            throw new Error('Node to remove does not exist.');
        } else {
            childToRemove = parent.children.splice(index, 1);
        }
    } else {
        throw new Error('Parent does not exist.');
    }
 
    return childToRemove;
};
 
function findIndex(arr, id) {
    var index;
 
    for (var i = 0; i < arr.length; i++) {
        if (arr[i].id === id) {
            index = i;
        }
    }
 
    return index;
}


/**
 * 
 * AUX FUNCTIONS
 * 
 **/

function treePathsToArray (data, array, path, currentDepth, maxDepth, includeIDs){


    if (maxDepth != 0) {
   
        for (var i = 0, len = array.length; i < len; i++) {
                // currentDepth + 1 since we are analyzing the children
            if (typeof array[i].children != "undefined" && array[i].children != null && array[i].children.length > 0 && currentDepth + 1< maxDepth){
                switch(includeIDs){
                    case ALL_ID:
                        // adds to path each level ids and name
                        data = treePathsToArray(data, array[i].children, path.concat([array[i].id, array[i].code, array[i].name]), currentDepth+1, maxDepth, includeIDs);
                        break;     
                    default:  
                        // it lets to last level the decision wheter to put ids or not
                        data = treePathsToArray(data, array[i].children, path.concat(array[i].name), currentDepth+1, maxDepth, includeIDs);
                }               
               
            } else {
                var newPath = path.slice();
                switch(includeIDs){
                    case NO_ID:
                        break;
                    case LAST_LEVEL_ID:
                        newPath[0] = array[i].id;
                        newPath[1] = array[i].code;
                        break;
                    case ALL_ID:
                        newPath.push(array[i].id);
                        newPath.push(array[i].code);
                        break;                        
                }
                newPath.push(array[i].name);
                data.push(newPath);
            }
        }
    } else {
        data.push(path);
    }
    return data;
}
    