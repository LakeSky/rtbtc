namespace PagerWebControls
{
    using System;
    using System.Collections.Generic;
    using System.Web.UI;
    using System.Web.UI.WebControls;

    /// <summary>Event agruments for pager control</summary>
    public class PagerEventArgs : EventArgs
    {
        /// <summary>Gets or sets the page number that is fired</summary>
        public int Number
        {
            get; set;
        }

        /// <summary>Gets or sets a value indicating whether the first button has been click</summary>
        public bool First
        {
            get; set;
        }

        /// <summary>Gets or sets a value indicating whether the previous button has been click</summary>
        public bool Previous
        {
            get; set;
        }

        /// <summary>Gets or sets a value indicating whether the next button has been click</summary>
        public bool Next
        {
            get; set;
        }

        /// <summary>Gets or sets a value indicating whether the last button has been click</summary>
        public bool Last
        {
            get; set;
        }

        /// <summary>Gets or sets the number of rows each page contains</summary>
        public int PageSize
        {
            get;
            set;
        }
    }

    /// <summary>Provides a basic paging control that fires an event when a link is clicked</summary>
    public partial class Pager : UserControl
    {
        #region Events
        /// <summary>Fires when a  link is clicked, the text with in the object (link button) is the number</summary>
        public event EventHandler<PagerEventArgs> Change;
        #endregion

        #region Properties
        /// <summary>
        /// Gets or sets total number of pages the datasource is capable of.
        /// </summary>
        public int TotalPages
        {
            get
            {
                if (ViewState["TotalPages"] == null)
                {
                    ViewState["TotalPages"] = 0;
                }

                return Convert.ToInt32(ViewState["TotalPages"]);
            }

            set
            {
                ViewState["TotalPages"] = value;
            }
        }

        /// <summary>
        /// Gets or sets the "First" record display text
        /// </summary>
        public string FirstText
        {
            get; set;
        }

        /// <summary>
        /// Gets or sets the "Previous" record display text
        /// </summary>
        public string PreviousText
        {
            get; set;
        }

        /// <summary>
        /// Gets or sets the "Next" record display text
        /// </summary>
        public string NextText
        {
            get; set;
        }

        /// <summary>
        /// Gets or sets the "Last" record display text
        /// </summary>
        public string LastText
        {
            get; set;
        }

        /// <summary>
        /// Gets or sets the seperator display text
        /// </summary>
        public string Separator
        {
            get;
            set;
        }

        /// <summary>
        /// Enables/disables the "GoTo" functionality
        /// </summary>
        public bool ShowGoTo
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the number of pages to display at
        /// </summary>
        public int NumberOfPages
        {
            get
            {
                if (ViewState["NumberOfPages"] == null)
                {
                    ViewState["NumberOfPages"] = 10;
                }

                return Convert.ToInt32(ViewState["NumberOfPages"]);
            }

            set
            {
                ViewState["NumberOfPages"] = value;
            }
        }

        /// <summary>
        /// Gets or sets the current page number
        /// </summary>
        public int CurrentPageNumber
        {
            get
            {
                if (ViewState["CurrentPageNumber"] == null)
                {
                    ViewState["CurrentPageNumber"] = 1;
                }

                return Convert.ToInt32(ViewState["CurrentPageNumber"]);
            }

            set
            {
                ViewState["CurrentPageNumber"] = value;
            }
        }

        /// <summary>
        /// Gets or sets the page size, mainley used as a helpful reminder
        /// </summary>
        public int PageSize
        {
            get
            {
                if (ViewState["PageSize"] == null)
                {
                    ViewState["PageSize"] = 10;
                }

                return Convert.ToInt32(ViewState["PageSize"]);
            }

            set
            {
                ViewState["PageSize"] = value;
            }
        }

        /// <summary>
        /// Gets or sets the css class for the currently selected tab
        /// </summary>
        public string CssClass
        {
            get; set;
        }

        #endregion 

        #region Public Methods
        /// <summary> Generates the pagers links based upon the controls properties </summary>
        public void GenerateLinks()
        {
            var display = new List<int>();
            int minimum;
            int maximum;
            CalculateBoundry(this.NumberOfPages, this.TotalPages, this.CurrentPageNumber, out minimum, out maximum);
            for (int i = minimum; i <= maximum; i++)
            {
                display.Add(i);
            }

            RepeaterNumbers.DataSource = display;
            RepeaterNumbers.DataBind();

            bool dataToDisplay = this.TotalPages > 0;

            LinkButtonFirst.Visible = dataToDisplay;
            LinkButtonPrevious.Visible = dataToDisplay;
            LinkButtonNext.Visible = dataToDisplay;
            LinkButtonLast.Visible = dataToDisplay;

            if (this.TotalPages < 1 || !this.ShowGoTo)
            {
                //this.ButtonGoTo.Visible = false;
                //this.TextBoxGoTo.Visible = false;
            }
            else
            {
                //this.ButtonGoTo.Visible = true;
                //this.TextBoxGoTo.Visible = true;
            }

            this.LinkButtonFirst.Enabled = !(this.CurrentPageNumber <= 1);
            this.LinkButtonPrevious.Enabled = !(this.CurrentPageNumber <= 1);
            this.LinkButtonNext.Enabled = !(this.CurrentPageNumber >= this.TotalPages);
            this.LinkButtonLast.Enabled = !(this.CurrentPageNumber >= this.TotalPages);
        }
        #endregion

        #region Protected Methods
        /// <summary>
        /// Runs the initlaisation code
        /// </summary>
        /// <param name="sender">The object that fired this event</param>
        /// <param name="e">Additional arguments passes</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.LinkButtonFirst.Text = this.FirstText ?? "|<";
                this.LinkButtonPrevious.Text = this.PreviousText ?? "<";
                this.LinkButtonNext.Text = this.NextText ?? ">";
                this.LinkButtonLast.Text = this.LastText ?? ">|";
            }
        }

        /// <summary>
        /// Determins if the current page number is the same as the page number passed through
        /// </summary>
        /// <param name="pageNumber">Page number to check against</param>
        /// <returns>True if they match</returns>
        protected bool IsCurrentPage(int pageNumber)
        {
            return pageNumber == this.CurrentPageNumber;
        }

        #region buttons clicked
        /// <summary>Fires the FirstClicked event</summary>
        /// <param name="sender">Object that fires this event</param>
        /// <param name="e">Additional arguments passed</param>
        protected void LinkButtonFirst_Click(object sender, EventArgs e)
        {
            if (this.Change != null)
            {
                this.CurrentPageNumber = 1;
                var args = new PagerEventArgs
                               {
                                   First = true, 
                                   Previous = false, 
                                   Next = false, 
                                   Last = false, 
                                   Number = this.CurrentPageNumber, 
                                   PageSize = this.PageSize
                               };
                this.Change(this, args);
            }
        }

        /// <summary>Fires the PreviousClicked event</summary>
        /// <param name="sender">Object that fires this event</param>
        /// <param name="e">Additional arguments passed</param>
        protected void LinkButtonPrevious_Click(object sender, EventArgs e)
        {
            if (this.Change != null)
            {
                this.CurrentPageNumber--;
                var args = new PagerEventArgs
                               {
                                   First = false, 
                                   Previous = true, 
                                   Next = false, 
                                   Last = false, 
                                   Number = this.CurrentPageNumber, 
                                   PageSize = this.PageSize
                               };
                this.Change(this, args);
            }
        }

        /// <summary>Fires the NumbereClicked event</summary>
        /// <param name="sender">Object that fires this event</param>
        /// <param name="e">Additional arguments passed</param>
        protected void LinkButtonNumber_Click(object sender, EventArgs e)
        {
            if (this.Change != null)
            {
                var number = Convert.ToInt32(((LinkButton)sender).Text);
                this.CurrentPageNumber = number;
                var args = new PagerEventArgs
                               {
                                   First = false,
                                   Previous = false,
                                   Next = false,
                                   Last = false,
                                   Number = number,
                                   PageSize = this.PageSize
                               };
                this.Change(this, args);
            }
        }

        /// <summary>Fires the NextClicked event</summary>
        /// <param name="sender">Object that fires this event</param>
        /// <param name="e">Additional arguments passed</param>
        protected void LinkButtonNext_Click(object sender, EventArgs e)
        {
            if (this.Change != null)
            {
                this.CurrentPageNumber++;
                var args = new PagerEventArgs
                               {
                                   First = false,
                                   Previous = false,
                                   Next = true,
                                   Last = false,
                                   Number = this.CurrentPageNumber,
                                   PageSize = this.PageSize
                               };
                this.Change(this, args);
            }
        }

        /// <summary>Fires the LastClicked event</summary>
        /// <param name="sender">Object that fires this event</param>
        /// <param name="e">Additional arguments passed</param>
        protected void LinkButtonLast_Click(object sender, EventArgs e)
        {
            if (this.Change != null)
            {
                this.CurrentPageNumber = this.TotalPages;
                var args = new PagerEventArgs
                               {
                                   First = false,
                                   Previous = false,
                                   Next = false,
                                   Last = true,
                                   Number = this.CurrentPageNumber,
                                   PageSize = this.PageSize
                               };
                this.Change(this, args);
            }
        }

        /// <summary>Fires the NumbereClicked event</summary>
        /// <param name="sender">Object that fires this event</param>
        /// <param name="e">Additional arguments passed</param>
        //protected void ButtonGoTo_Click(object sender, EventArgs e)
        //{
        //    if (this.Change != null)
        //    {
        //        int number;
        //        if (int.TryParse(this.TextBoxGoTo.Text, out number))
        //        {
        //            if (number <= this.TotalPages)
        //            {
        //                this.CurrentPageNumber = number;
        //                var args = new PagerEventArgs
        //                               {
        //                                   First = false,
        //                                   Previous = false,
        //                                   Next = false,
        //                                   Last = false,
        //                                   Number = number,
        //                                   PageSize = this.PageSize
        //                               };
        //                this.Change(this, args);
        //            }
        //        }
        //    }
        //}
        #endregion

        #endregion

        #region Private Methods
        /// <summary>
        /// Calculates the upper/lower boundries for the pager to use when generating the page tabs
        /// </summary>
        /// <param name="maximumPages">Maximum nuber of pages along the bottom of the pager</param>
        /// <param name="totalPages">Total number of pages in the datasource</param>
        /// <param name="currentPage">Current page number</param>
        /// <param name="lowerBound">Returns the lowest boundry</param>
        /// <param name="upperBound">Returns the upper boundry</param>
        private static void CalculateBoundry(int maximumPages, int totalPages, int currentPage, out int lowerBound, out int upperBound)
        {
            if (totalPages < maximumPages)
            {
                lowerBound = 1;
                upperBound = totalPages;
            }
            else
            {
                // NOTE: Look in to saturated arithmetic
                var rightDisplay = maximumPages / 2;
                var leftDisplay = maximumPages - rightDisplay;

                lowerBound = currentPage - leftDisplay;
                var lowerOffset = 0 - lowerBound;

                upperBound = currentPage + rightDisplay + (lowerOffset > 0 ? lowerOffset : 0);
                var upperOffset = upperBound > totalPages ? upperBound - totalPages : 0;
                upperBound = (totalPages - upperBound) > 0 ? upperBound : totalPages;

                lowerBound = lowerBound > 0 ? (lowerBound + lowerBound > upperOffset ? lowerBound - upperOffset + 1 : 1) : 1;
            }
        }

        #endregion
    }
}