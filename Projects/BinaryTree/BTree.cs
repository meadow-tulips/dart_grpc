using System;
namespace BinaryTree
{
    public class BTree<Type>
    {

        private BinaryTreeNode<Type> root;

        public BTree()
        {
            root = null;
        }
        public virtual void Clear()
        {
            root = null;
        }

        BinaryTreeNode<Type> Root  {
            get
            {
                return root;
            }

            set
            {
                root = value;
            }
        }
    }
}
