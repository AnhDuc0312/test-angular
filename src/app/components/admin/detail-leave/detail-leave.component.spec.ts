import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DetailLeaveComponent } from './detail-leave.component';

describe('DetailLeaveComponent', () => {
  let component: DetailLeaveComponent;
  let fixture: ComponentFixture<DetailLeaveComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [DetailLeaveComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(DetailLeaveComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
