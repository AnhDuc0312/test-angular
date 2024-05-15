import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DetailOvertimeComponent } from './detail-overtime.component';

describe('DetailOvertimeComponent', () => {
  let component: DetailOvertimeComponent;
  let fixture: ComponentFixture<DetailOvertimeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [DetailOvertimeComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(DetailOvertimeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
