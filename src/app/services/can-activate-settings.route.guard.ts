import {Injectable} from '@angular/core';
import {Router, CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot} from '@angular/router';
import {Observable, Subscription} from 'rxjs/Rx';
import {CryptoService} from './crypto.service';
import {ToasterService} from 'angular2-toaster/angular2-toaster';

@Injectable()
export class CanActivateSettings implements CanActivate {

  constructor (private router: Router, private toaster: ToasterService) {
  }

  private _canActivate() {
    return !!localStorage.getItem('auth_token');
  }

  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot
  ): Observable<boolean>|boolean {
    let can = this._canActivate();
    if (!can) {
      this.router.navigate(['/login']);
      return false;
    }
    return true;
  }

}