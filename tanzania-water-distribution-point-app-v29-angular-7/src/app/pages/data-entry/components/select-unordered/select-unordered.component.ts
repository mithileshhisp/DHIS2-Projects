import {
  Component,
  OnInit,
  Input,
  Output,
  EventEmitter,
  ContentChild,
  TemplateRef
} from '@angular/core';

@Component({
  selector: 'app-select-unordered',
  templateUrl: './select-unordered.component.html',
  styleUrls: ['./select-unordered.component.css']
})
export class SelectUnorderedComponent implements OnInit {
  @Input() selected: any;
  @Input() options;
  @Input() isOpen;
  @Input()
  settings: any = {
    valueField: 'value',
    textField: 'text',
    multipleSelection: false
  };
  @Input() template: TemplateRef<any>;

  searchOptions;
  searchText;
  @Output() valueSelected = new EventEmitter();
  constructor() {}

  ngOnInit() {
    this.searchOptions = {
      shouldSort: true,
      tokenize: true,
      findAllMatches: true,
      threshold: 0,
      location: 0,
      distance: 100,
      maxPatternLength: 32,
      minMatchCharLength: 1,
      keys: [this.settings.textField]
    };
  }

  onBlur() {
    this.searchText = '';
  }

  clearValue() {
    this.selected = '';
    this.valueSelected.emit('');
  }

  select(option) {
    this.searchText = '';
    this.selected = option[this.settings.valueField];
    this.valueSelected.emit(option[this.settings.valueField]);
  }
  public toggleDropdown($event: MouseEvent): void {
    $event.preventDefault();
    $event.stopPropagation();
    this.isOpen = !this.isOpen;
  }
}
