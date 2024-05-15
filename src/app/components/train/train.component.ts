import { Component, ViewChild } from '@angular/core';

@Component({
  selector: 'app-train',
  // standalone: true,
  // imports: [],
  templateUrl: './train.component.html',
  styleUrl: './train.component.scss'
})
export class TrainComponent {
  videos = [
    { title: 'Video 1', url: '../../../assets/video/001 About this course.mp4' },
    { title: 'Video 2', url: '../../../assets/video/001 About this course.mp4' },
    { title: 'Video 2', url: '../../../assets/video/001 About this course.mp4' },
    { title: 'Video 2', url: '../../../assets/video/001 About this course.mp4' },
    { title: 'Video 2', url: '../../../assets/video/001 About this course.mp4' },
    { title: 'Video 2', url: '../../../assets/video/001 About this course.mp4' },
    { title: 'Video 2', url: '../../../assets/video/001 About this course.mp4' },
    { title: 'Video 2', url: '../../../assets/video/001 About this course.mp4' },
    { title: 'Video 2', url: '../../../assets/video/001 About this course.mp4' },
    { title: 'Video 2', url: '../../../assets/video/001 About this course.mp4' },
    { title: 'Video 2', url: '../../../assets/video/001 About this course.mp4' },
    // Add more videos as needed
  ];

  selectedVideo: { title: string, url: string } | null = null;

  @ViewChild('mainVideo') mainVideo: any;

  // playVideo(video: { title: string, url: string }): void {
  //   this.selectedVideo = video;
  //   if (this.mainVideo) {
  //     this.mainVideo.nativeElement.play();
  //   }
  // }
  playVideo(video: { title: string, url: string }): void {
    this.selectedVideo = video;
    setTimeout(() => {
      if (this.mainVideo && this.mainVideo.nativeElement) {
        this.mainVideo.nativeElement.play();
      }
    }, 0); // Sử dụng setTimeout để đảm bảo rằng video đã render hoàn toàn trước khi gọi phương thức play()
  }
}
