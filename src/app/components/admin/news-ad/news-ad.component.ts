import { Component , OnInit } from '@angular/core';
import { News } from '../../../models/news';
import { NewsService } from '../../../services/news.service';
import { Router } from '@angular/router';
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';
import { ChangeEvent } from '@ckeditor/ckeditor5-angular';

interface EditedNews {
  id: number;
  title : string
  content: string;
  isEditing: boolean;
}

@Component({
  selector: 'app-news-ad',
  // standalone: true,
  // imports: [],
  templateUrl: './news-ad.component.html',
  styleUrl: './news-ad.component.scss'
})
export class NewsAdComponent implements OnInit{

  newsList: News[] = [];
  Editor = ClassicEditor;
  editedNewsList: EditedNews[] = [];


  constructor(private newsService: NewsService, private router: Router) { }

  ngOnInit(): void {
    // this.newsList = this.newsService.getAllNews();
    this.getAlls();
  }

  getAlls() {
    debugger
    this.newsService.getAll().subscribe({
      next: (response: any) => {
        debugger
        this.newsList = response;
        this.editedNewsList = this.newsList.map(news => ({ id: news.id, title : news.title, content: news.content, isEditing: false }));
        // this.totalPages = response.totalPages;
        // this.visiblePages = this.generateVisiblePageArray(this.currentPage, this.totalPages);
      },
      complete: () => {
        debugger;
      },
      error: (error: any) => {
        debugger;
        console.error('Error fetching products:', error);
      }
    });    
  }

  onContentBlur(event: any, news: EditedNews) {
    news.content = event.editor.getData();
  }

  addNews() {
    this.router.navigate(['/admin/news/add']);
  }
  editNews(newsId: number, updatedNewsContent: string) {
    // Tìm tin tức trong mảng editedNewsList có id tương ứng
  const editedNews = this.editedNewsList.find(news => news.id === newsId);
  if (editedNews) {
    const newsUpdate = {
      title: editedNews.title,
      content: editedNews.content
    };
  
    // Gửi yêu cầu API để cập nhật nội dung tin tức
    this.newsService.update(newsId , newsUpdate).subscribe(
      () => {
        // Cập nhật thành công, cập nhật giao diện hoặc thông báo thành công
        console.log('News updated successfully!');
        alert("News updated successfully!")
        // Cập nhật lại danh sách tin tức sau khi cập nhật
        
      },
      (error) => {
        console.error('Error updating news:', error);
        alert ("Lỗi")
        // Xử lý lỗi, hiển thị thông báo lỗi cho người dùng
      }
      
    );
    this.router.navigate(['/admin/news']);
  }
}

  deleteNews(newsId: number) {
    const isConfirmed = window.confirm("Are you sure you want to delete this news?");
    if(isConfirmed) {
      // Gửi yêu cầu API để xóa tin tức
    this.newsService.delete(newsId).subscribe(
      () => {
        // Xóa thành công, cập nhật giao diện hoặc thông báo thành công
        console.log('News deleted successfully!');
        alert('News deleted successfully!')
        // Cập nhật lại danh sách tin tức sau khi xóa
        ;
      },
      (error) => {
        console.error('Error deleting news:', error);
        alert("Lỗi")
        // Xử lý lỗi, hiển thị thông báo lỗi cho người dùng
      }
      
    );
    this.router.navigate(['/admin/news']);
    }
    
  }
}
