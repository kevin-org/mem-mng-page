<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <style type="text/css">
        p {
            margin-bottom: 20px;
        }
    </style>
</head>

<body class="layui-row">
    
    <div class="layui-col-md3" style="padding: 10px 10px;">
        <!-- <div id="demo"></div> -->
    </div>

    <div class="layui-col-md6" style="padding: 10px 10px;">
        <%--<fieldset class="layui-elem-field layui-field-title">
            <legend>基本功能</legend>
            <div class="layui-field-box">
                <p>
                    <button class="layui-btn layui-btn-sm layui-btn-primary" id="expand" onmouseover="showTips1()">展开</button>
                    <button class="layui-btn layui-btn-sm layui-btn-primary" id="collapse" onmouseover="showTips2()">收起</button>
                    <button class="layui-btn layui-btn-sm layui-btn-primary" id="destory" onmouseover="showTips10()">销毁</button>
                </p>
                <p>
                    <button class="layui-btn layui-btn-sm layui-btn-primary" id="selected" onmouseover="showTips3()">获取选中节点</button>
                    <button class="layui-btn layui-btn-sm layui-btn-primary" id="all" onmouseover="showTips8()">获取所有节点</button>
                    <button class="layui-btn layui-btn-sm layui-btn-primary" id="getNode" onmouseover="showTips9()">获取节点信息</button>
                </p>
                <p>
                    <button class="layui-btn layui-btn-sm layui-btn-primary" id="expandNode" onmouseover="showTips11()">展开节点</button>
                    <button class="layui-btn layui-btn-sm layui-btn-primary" id="collapseNode" onmouseover="showTips12()">折叠节点</button>
                    <button class="layui-btn layui-btn-sm layui-btn-primary" id="checkNode" onmouseover="showTips13()">勾选节点</button>
                    <button class="layui-btn layui-btn-sm layui-btn-primary" id="uncheckNode" onmouseover="showTips14()">取消勾选节点</button>
                </p>
                <p>
                </p>
            </div>
        </fieldset>

        <fieldset class="layui-elem-field layui-field-title">
            <legend>编辑功能</legend>
            <div class="layui-field-box">
                <p>
                    <button class="layui-btn layui-btn-sm" id="addNode2" onmouseover="showTips4()">添加根节点</button>
                    <button class="layui-btn layui-btn-sm" id="addNode" onmouseover="showTips5()">添加子节点</button>
                </p>
                
                <p>
                    <button class="layui-btn layui-btn-sm layui-btn-normal" id="editNode" onmouseover="showTips6()">编辑节点</button>
                </p>

                <p>
                    <button class="layui-btn layui-btn-sm layui-btn-danger" id="removeNode" onmouseover="showTips7()">删除节点</button>
                </p>
            </div>
        </fieldset>--%>

        <div id="demo"></div>
    </div>
    <div class="layui-col-md3" style="padding: 10px 10px;"></div>
</body>

<script type="text/javascript">

function del(row) {
    alert(row.id)
}

var layout = [
    { name: '菜单名称', treeNodes: true, headerClass: 'value_col', colClass: 'value_col', style: '' },
    {
        name: '操作',
        headerClass: 'value_col',
        colClass: 'value_col',
        style: 'width: 20%',
        render: function(row) {
            return "<a class='layui-btn layui-btn-danger layui-btn-sm' onclick='del(" + row + ")'><i class='layui-icon'>&#xe640;</i>删除</a>"; //列渲染
        }
    },
];

layui.use(['form', 'treetable', 'layer'], function() {
    var layer = layui.layer, form = layui.form, $ = layui.jquery;

    var tree = layui.treetable({
        elem: '#demo', //传入元素选择器
        spreadable: false, //设置是否全展开，默认不展开
        checkbox : true,
        nodes: [{
                "id": "1",
                "name": "父节点1",
                "checked" : false,
                "children": [{
                        "id": "11",
                        "name": "子节点11",
                    },
                    {
                        "id": "12",
                        "name": "子节点12",
                    }
                ]
            },
            {
                "id": "2",
                "name": "父节点2",
                "checked" : true,
                "children": [{
                    "id": "21",
                    "name": "子节点21",
                    "children": [{
                        "id": "211",
                        "name": "子节点211"
                    }]
                }]
            },
            {
                "id": "3",
                "name": "父节点3"
            }
        ],
        layout: layout
    });

    form.render();

    $('#collapse').on('click', function() {
        tree.collapse();
    });

    $('#expand').on('click', function() {
        tree.expand();
    });

    $('#selected').on('click', function() {
        console.log(tree.getSelected());
        alert(JSON.stringify(tree.getSelected()));
    });

    $('#editNode').on('click', function() {
        var node = tree.getNode("3");
        node.name = '我就是变个名字';
        tree.editNodeName(node);
    });

    $('#removeNode').on('click', function() {
        var node = tree.getNode("2");
        tree.removeNode(node);
    });

    $('#getNode').on('click', function() {
        var node = tree.getNode("2");
        alert(JSON.stringify(node));
    });

    $('#all').on('click', function() {
        alert(JSON.stringify(tree.getNodes()));
    });

    $('#addNode').on('click', function() {
        tree.addNode(tree.getNode("2"), {
            "id": "22", "name": "子节点22", "children": [{
                "id": "221",
                "name": "子节点221",
                "children": [{
                    "id": "2211",
                    "name": "子节点2211",
                    "children": [{
                        "id": "22111",
                        "name": "子节点22111"
                    }]
                }]
            },
            {
                "id": "222",
                "name": "子节点222",
                "children": [{
                    "id": "2221",
                    "name": "子节点2221",
                    "children": [{
                        "id": "22211",
                        "name": "子节点22211"
                    }]
                }]
            }]
        });
    });

    $('#addNode2').on('click', function() {
        tree.addNode(null, {
            "id": "4", "name": "父节点4", "children": [{
                "id": "41",
                "name": "子节点41",
                "children": [{
                    "id": "411",
                    "name": "子节点411",
                    "children": [{
                        "id": "4111",
                        "name": "子节点4111"
                    }]
                }]
            },
            {
                "id": "42",
                "name": "子节点42",
                "children": [{
                    "id": "421",
                    "name": "子节点421",
                    "children": [{
                        "id": "4211",
                        "name": "子节点4211"
                    }]
                }]
            }]
        });
    });

    $('#destory').on('click', function() {
        tree.destory();
    });
    
    $('#expandNode').on('click', function() {
        tree.expandNode(tree.getNode("2"), false);
    });

    $('#collapseNode').on('click', function() {
        tree.collapseNode(tree.getNode("2"), false);
    });

    $('#checkNode').on('click', function() {
        tree.checkNode(tree.getNode("1"), true);
    });

    $('#uncheckNode').on('click', function() {
        tree.checkNode(tree.getNode("1"), false);
    });

});


</script>

</html>