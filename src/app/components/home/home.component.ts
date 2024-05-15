import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-home',
  // standalone: true,
  // imports: [],
  templateUrl: './home.component.html',
  styleUrl: './home.component.scss'
})
export class HomeComponent implements OnInit{
  ngOnInit(): void {
    
    this.activateCarousel();
  }
  slideInterval: number = 5000;
  currentPage: number = 1;
  itemsPerPage: number = 6; // Số lượng tin tức hiển thị trên mỗi trang
  newsItemsForColumn1: any[] = [
    { title: 'Tin tức 1', content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam dignissim risus sit amet nisl auctor, eu feugiat turpis consequat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Duis non quam ut velit rhoncus convallis. Praesent vel orci eu sapien semper iaculis. Vivamus at ex at nulla porttitor volutpat eget et nibh. Fusce id ligula nisi. Duis id consequat libero. Nulla facilisi. Nullam convallis vestibulum nisl, eget tincidunt odio tincidunt in. Nullam nec dui arcu.' },
    { title: 'Tin tức 2', content: 'Maecenas sagittis dolor a erat finibus, vitae fermentum arcu tristique. Duis sit amet orci vel ligula consectetur hendrerit. Phasellus vestibulum orci et nunc fringilla, non condimentum nisl fermentum. Sed pharetra felis eu velit vehicula, sed facilisis nulla accumsan. Integer et dui ut arcu venenatis tempor. Nam mattis est sed lectus bibendum, vel varius mi pharetra. Morbi interdum, odio eget venenatis tincidunt, arcu sem ultricies elit, eu feugiat est ex nec est.' },
    { title: 'Tin tức 3', content: 'Maecenas sagittis dolor a erat finibus, vitae fermentum arcu tristique. Duis sit amet orci vel ligula consectetur hendrerit. Phasellus vestibulum orci et nunc fringilla, non condimentum nisl fermentum. Sed pharetra felis eu velit vehicula, sed facilisis nulla accumsan. Integer et dui ut arcu venenatis tempor. Nam mattis est sed lectus bibendum, vel varius mi pharetra. Morbi interdum, odio eget venenatis tincidunt, arcu sem ultricies elit, eu feugiat est ex nec est.' },
    { title: 'Tin tức 4', content: 'Maecenas sagittis dolor a erat finibus, vitae fermentum arcu tristique. Duis sit amet orci vel ligula consectetur hendrerit. Phasellus vestibulum orci et nunc fringilla, non condimentum nisl fermentum. Sed pharetra felis eu velit vehicula, sed facilisis nulla accumsan. Integer et dui ut arcu venenatis tempor. Nam mattis est sed lectus bibendum, vel varius mi pharetra. Morbi interdum, odio eget venenatis tincidunt, arcu sem ultricies elit, eu feugiat est ex nec est.' },
    { title: 'Tin tức 5', content: 'Maecenas sagittis dolor a erat finibus, vitae fermentum arcu tristique. Duis sit amet orci vel ligula consectetur hendrerit. Phasellus vestibulum orci et nunc fringilla, non condimentum nisl fermentum. Sed pharetra felis eu velit vehicula, sed facilisis nulla accumsan. Integer et dui ut arcu venenatis tempor. Nam mattis est sed lectus bibendum, vel varius mi pharetra. Morbi interdum, odio eget venenatis tincidunt, arcu sem ultricies elit, eu feugiat est ex nec est.' },
    { title: 'Tin tức 6', content: 'Maecenas sagittis dolor a erat finibus, vitae fermentum arcu tristique. Duis sit amet orci vel ligula consectetur hendrerit. Phasellus vestibulum orci et nunc fringilla, non condimentum nisl fermentum. Sed pharetra felis eu velit vehicula, sed facilisis nulla accumsan. Integer et dui ut arcu venenatis tempor. Nam mattis est sed lectus bibendum, vel varius mi pharetra. Morbi interdum, odio eget venenatis tincidunt, arcu sem ultricies elit, eu feugiat est ex nec est.' },
    { title: 'Tin tức 7', content: 'Maecenas sagittis dolor a erat finibus, vitae fermentum arcu tristique. Duis sit amet orci vel ligula consectetur hendrerit. Phasellus vestibulum orci et nunc fringilla, non condimentum nisl fermentum. Sed pharetra felis eu velit vehicula, sed facilisis nulla accumsan. Integer et dui ut arcu venenatis tempor. Nam mattis est sed lectus bibendum, vel varius mi pharetra. Morbi interdum, odio eget venenatis tincidunt, arcu sem ultricies elit, eu feugiat est ex nec est.' },
    { title: 'Tin tức 8', content: 'Maecenas sagittis dolor a erat finibus, vitae fermentum arcu tristique. Duis sit amet orci vel ligula consectetur hendrerit. Phasellus vestibulum orci et nunc fringilla, non condimentum nisl fermentum. Sed pharetra felis eu velit vehicula, sed facilisis nulla accumsan. Integer et dui ut arcu venenatis tempor. Nam mattis est sed lectus bibendum, vel varius mi pharetra. Morbi interdum, odio eget venenatis tincidunt, arcu sem ultricies elit, eu feugiat est ex nec est.' },
    { title: 'Tin tức 9', content: 'Maecenas sagittis dolor a erat finibus, vitae fermentum arcu tristique. Duis sit amet orci vel ligula consectetur hendrerit. Phasellus vestibulum orci et nunc fringilla, non condimentum nisl fermentum. Sed pharetra felis eu velit vehicula, sed facilisis nulla accumsan. Integer et dui ut arcu venenatis tempor. Nam mattis est sed lectus bibendum, vel varius mi pharetra. Morbi interdum, odio eget venenatis tincidunt, arcu sem ultricies elit, eu feugiat est ex nec est.' },
    { title: 'Tin tức 10', content: 'Maecenas sagittis dolor a erat finibus, vitae fermentum arcu tristique. Duis sit amet orci vel ligula consectetur hendrerit. Phasellus vestibulum orci et nunc fringilla, non condimentum nisl fermentum. Sed pharetra felis eu velit vehicula, sed facilisis nulla accumsan. Integer et dui ut arcu venenatis tempor. Nam mattis est sed lectus bibendum, vel varius mi pharetra. Morbi interdum, odio eget venenatis tincidunt, arcu sem ultricies elit, eu feugiat est ex nec est.' },
    { title: 'Tin tức 11', content: 'Maecenas sagittis dolor a erat finibus, vitae fermentum arcu tristique. Duis sit amet orci vel ligula consectetur hendrerit. Phasellus vestibulum orci et nunc fringilla, non condimentum nisl fermentum. Sed pharetra felis eu velit vehicula, sed facilisis nulla accumsan. Integer et dui ut arcu venenatis tempor. Nam mattis est sed lectus bibendum, vel varius mi pharetra. Morbi interdum, odio eget venenatis tincidunt, arcu sem ultricies elit, eu feugiat est ex nec est.' },
    { title: 'Tin tức 12', content: 'Maecenas sagittis dolor a erat finibus, vitae fermentum arcu tristique. Duis sit amet orci vel ligula consectetur hendrerit. Phasellus vestibulum orci et nunc fringilla, non condimentum nisl fermentum. Sed pharetra felis eu velit vehicula, sed facilisis nulla accumsan. Integer et dui ut arcu venenatis tempor. Nam mattis est sed lectus bibendum, vel varius mi pharetra. Morbi interdum, odio eget venenatis tincidunt, arcu sem ultricies elit, eu feugiat est ex nec est.' },
    { title: 'Tin tức 13', content: 'Maecenas sagittis dolor a erat finibus, vitae fermentum arcu tristique. Duis sit amet orci vel ligula consectetur hendrerit. Phasellus vestibulum orci et nunc fringilla, non condimentum nisl fermentum. Sed pharetra felis eu velit vehicula, sed facilisis nulla accumsan. Integer et dui ut arcu venenatis tempor. Nam mattis est sed lectus bibendum, vel varius mi pharetra. Morbi interdum, odio eget venenatis tincidunt, arcu sem ultricies elit, eu feugiat est ex nec est.' },
    { title: 'Tin tức 14', content: 'Maecenas sagittis dolor a erat finibus, vitae fermentum arcu tristique. Duis sit amet orci vel ligula consectetur hendrerit. Phasellus vestibulum orci et nunc fringilla, non condimentum nisl fermentum. Sed pharetra felis eu velit vehicula, sed facilisis nulla accumsan. Integer et dui ut arcu venenatis tempor. Nam mattis est sed lectus bibendum, vel varius mi pharetra. Morbi interdum, odio eget venenatis tincidunt, arcu sem ultricies elit, eu feugiat est ex nec est.' },
    { title: 'Tin tức 15', content: 'Maecenas sagittis dolor a erat finibus, vitae fermentum arcu tristique. Duis sit amet orci vel ligula consectetur hendrerit. Phasellus vestibulum orci et nunc fringilla, non condimentum nisl fermentum. Sed pharetra felis eu velit vehicula, sed facilisis nulla accumsan. Integer et dui ut arcu venenatis tempor. Nam mattis est sed lectus bibendum, vel varius mi pharetra. Morbi interdum, odio eget venenatis tincidunt, arcu sem ultricies elit, eu feugiat est ex nec est.' },
    { title: 'Tin tức 15', content: 'Maecenas sagittis dolor a erat finibus, vitae fermentum arcu tristique. Duis sit amet orci vel ligula consectetur hendrerit. Phasellus vestibulum orci et nunc fringilla, non condimentum nisl fermentum. Sed pharetra felis eu velit vehicula, sed facilisis nulla accumsan. Integer et dui ut arcu venenatis tempor. Nam mattis est sed lectus bibendum, vel varius mi pharetra. Morbi interdum, odio eget venenatis tincidunt, arcu sem ultricies elit, eu feugiat est ex nec est.' },
    

    // Thêm các tin tức khác tương tự nếu cần
  ];

  slides = [
    { imageUrl: 'https://congdankhuyenhoc.qltns.mediacdn.vn/449484899827462144/2024/2/15/20230324-dsc05535-1707976128988655781123.jpg' },
    { imageUrl: 'https://vcdn1-vnexpress.vnecdn.net/2023/10/21/BKHN-3317-1697880528.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=Man8-BBHVPH-yClBcB5lOg' },
    { imageUrl: 'https://vcdn-giadinh.vnecdn.net/2023/10/23/395250154-716919293813286-6537-5740-6140-1698041628.jpg' },
    { imageUrl: 'https://daklak24h.com.vn/images/news/2024/4/20/tuyen-sinh.jpg'}
  ];

  totalItems: number = this.newsItemsForColumn1.length; // Tổng số tin tức

  // Hàm tính tổng số trang dựa trên số lượng tin tức và số lượng tin tức trên mỗi trang
  getTotalPages(): number {
    return Math.ceil(this.totalItems / this.itemsPerPage);
  }

  // Hàm chuyển đến trang được chọn
  goToPage(pageNumber: number): void {
    if (pageNumber >= 1 && pageNumber <= this.getTotalPages()) {
      this.currentPage = pageNumber;
    }
  }
  activateCarousel(): void {
    setInterval(() => {
      const currentSlideIndex = document.querySelector('.carousel-item.active');
      const nextSlideIndex = currentSlideIndex?.nextElementSibling || document.querySelector('.carousel-item:first-child');
      if (currentSlideIndex && nextSlideIndex) {
        currentSlideIndex.classList.remove('active');
        nextSlideIndex.classList.add('active');
      }
    }, this.slideInterval);
  }

}
