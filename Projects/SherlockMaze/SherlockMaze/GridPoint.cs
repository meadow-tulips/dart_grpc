using System;
namespace SherlockMaze
{
	public class GridPoint
	{

		public int x { get; set; }
		public int y { get; set; }


		public GridPoint(int x, int y)
		{
			this.x = x;
			this.y = y;
		}


		public bool onGrid(int N, int M)
		{
			if ((x < N && x > 0) && (y > 0 && y < M))
				return true;
			else
				return false;

		}

	}
}
