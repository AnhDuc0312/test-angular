import { Component } from '@angular/core';
import { MdbModalRef } from 'mdb-angular-ui-kit/modal';
import { DomSanitizer, SafeHtml } from '@angular/platform-browser';

@Component({
  selector: 'app-modal',
  // standalone: true,
  // imports: [],
  templateUrl: './modal.component.html',
  styleUrl: './modal.component.scss'
})
export class ModalComponent {

  title: string | null = null;
  content : string = "";

  constructor(public modalRef: MdbModalRef<ModalComponent>,
    private sanitizer: DomSanitizer) {}

  sanitizeContent(content: string): SafeHtml {
    return this.sanitizer.bypassSecurityTrustHtml(content); // **Potentially risky!**
  }
}
