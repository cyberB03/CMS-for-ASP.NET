using System;
using System.Collections.Generic;
using System.Linq;

namespace N2.Templates.Mvc.Models.Pages
{
	[PageDefinition("Database Search",
		Description = "Searches for items searching for texts in the database.",
		SortOrder = 200,
		IconUrl = "~/Content/Img/zoom.png")]
	public class DatabaseSearch : SearchBase
	{
		[Obsolete("Text search is now used")]
		public override ICollection<ContentItem> Search(string query, int pageNumber, int pageSize, out int totalRecords)
		{
			return Context.Current.Resolve<Persistence.ITextSearcher>()
				.Search(SearchRoot, query, pageSize * pageNumber, pageSize, out totalRecords)
				.Select(i => i.IsPage ? i : Find.ClosestPage(i))
				.Distinct()
				.Where(Filter.Is.All(GetFilters()).Match)
				.ToList();
		}
	}
}