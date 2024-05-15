import { Component , OnInit} from '@angular/core';
import { DomSanitizer, SafeHtml } from '@angular/platform-browser';
import { News } from '../../models/news';
import { NewsService } from '../../services/news.service';
import { MatDialog } from '@angular/material/dialog';
import { PopupComponent } from '../popup/popup.component';
import { MdbModalRef, MdbModalService } from 'mdb-angular-ui-kit/modal';
import { ModalComponent } from '../modal/modal.component';

@Component({
  selector: 'app-news',
  // standalone: true,
  // imports: [],
  templateUrl: './news.component.html',
  styleUrl: './news.component.scss'
})
export class NewsComponent implements OnInit{


  newsList : News[] = [];
  modalRef: MdbModalRef<ModalComponent> | null = null;

  ngOnInit(): void {
    this.getAlls();
  }

  constructor(
    private newsService : NewsService,
    private sanitizer: DomSanitizer,
    public dialog: MatDialog,
    private modalService: MdbModalService
  ) {

  }

  sanitizeHtml(html: string): SafeHtml {
    return this.sanitizer.bypassSecurityTrustHtml(html);
  }

  toggleShowMore(news: News): void {
    news.showFullContent = !news.showFullContent;
  }

  openPopup() {
    const dialogRef = this.dialog.open(PopupComponent, {
      data: {
        message: 'This is a popup message'
      }
    });
  }
  openModal(news : News) {
    this.modalRef = this.modalService.open(ModalComponent , {
      data : 
      {title : news.title, content : news.content},
      modalClass: 'modal-lg',
      
    });
  }


  getAlls() {
    debugger
    this.newsService.getAll().subscribe({
      next:(response: News[]) => {
        this.newsList = response.map((news: News) => ({ ...news, showFullContent: false }));
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

}
