import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DetailRemoteComponent } from './detail-remote.component';

describe('DetailRemoteComponent', () => {
  let component: DetailRemoteComponent;
  let fixture: ComponentFixture<DetailRemoteComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [DetailRemoteComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(DetailRemoteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
