import { Component , OnInit ,Output, EventEmitter} from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { NewsService } from '../../../services/news.service';
import { Router } from '@angular/router';
import { News } from '../../../models/news';
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';

@Component({
  selector: 'app-add-news',
  // standalone: true,
  // imports: [],
  templateUrl: './add-news.component.html',
  styleUrl: './add-news.component.scss'
})
export class AddNewsComponent implements OnInit{
  @Output() newsAdded = new EventEmitter<any>();
  newsForm!: FormGroup;
  Editor = ClassicEditor;
  
  

  constructor(private formBuilder: FormBuilder, private newsService: NewsService, private router: Router) { }

  ngOnInit(): void {
    this.newsForm = this.formBuilder.group({
      title: ['', Validators.required],
      content: ['', Validators.required]
    });
  }

  onSubmit() {
    if (this.newsForm.valid) {
      this.newsService.create(this.newsForm.value)
        .subscribe(
          response => {
            console.log('Bài viết đã được tạo thành công:', response);
            this.router.navigate(['/admin/news']);
          },
          error => {
            console.error('Lỗi khi tạo bài viết:', error);
          }
        );
    } else {
      console.error('Form không hợp lệ.');
    }
  }
    
}

