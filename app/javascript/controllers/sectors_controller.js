import { Controller } from "stimulus"

export default class extends Controller {

  insert() {
    const name = this.targets.find("name").value;
    const city = this.targets.find("city").value;
    // console.log(name);
    // console.log(city);
  }

}
